defmodule EChronicler.Models.JournalEntryTest  do
  use EChronicler.DataCase, async: true
  import Ecto.Query, warn: false

  alias EChronicler.Models.JournalEntry

  @valid_journal_entry %{title: "Awesome Blog Post", author: "Grace", entry: "Time is an illustion, teatime doubly so."}

  test "format_datetime/1 returns formatted string if correct" do
    correct_datetime = %JournalEntry{title: "Awesome Blog Post", author: "Grace", entry: "Test.", inserted_at: ~U[2021-12-16 16:36:15.549610Z]}
    assert JournalEntry.format_datetime(correct_datetime) == "4:36, December 16, 2021"
  end

  test "format_datetime/1 returns error if incorrect" do
    incorrect_datetime = %JournalEntry{title: "Awesome Blog Post", author: "Grace", entry: "Test.", inserted_at: ""}
    assert JournalEntry.format_datetime(incorrect_datetime)  == "no date found"
  end

  test "truncate_journal_entry/1 truncates entry and adds ellipsis" do
    assert JournalEntry.truncate_journal_entry_text("Time is an illusion. Teatime doubly so. And time for tennis? Forget about it.") == "Time is an illusion. Teatime doubly so. And time fo..."
  end

  test "truncate_journal_entry/1 doesn't add ellipsis after short entry" do
    assert JournalEntry.truncate_journal_entry_text("Test.") == "Test."
  end

  test "truncate_journal_entry/1 returns blank entry" do
    assert JournalEntry.truncate_journal_entry_text("") == ""
  end

  test "get_journal_entry/1 returns journal entry with corresponding id" do
    {:ok, journal_entry} = JournalEntry.create_journal_entry(%{author: "Tiny", title: "1", entry: "1"})
    assert JournalEntry.get_journal_entry(journal_entry.id) == journal_entry
  end

  test "get_journal_entry/1 with id that doesn't work returns nil" do
    assert JournalEntry.get_journal_entry(6) == nil
  end


  test "create_journal_entry/1 with valid data creates a journal_entry" do

    assert {:ok, %JournalEntry{} = journal_entry} = EChronicler.Models.JournalEntry.create_journal_entry(@valid_journal_entry)
    assert journal_entry.author ==  "Grace"
    assert journal_entry.entry == "Time is an illustion, teatime doubly so."
    assert journal_entry.title == "Awesome Blog Post"
  end

  test "create_journal_entry/1 with no author throws an error" do
    author_nil = %{author: nil, entry: "Entry", title: "Title"}

    assert {:error, invalid_changeset} = EChronicler.Models.JournalEntry.create_journal_entry(author_nil)
    refute invalid_changeset.valid?
  end

  test "create_journal_entry/1 with no entry throws an error" do
    entry_nil = %{author: "Author", entry: nil, title: "Title"}

    assert {:error, invalid_changeset} = EChronicler.Models.JournalEntry.create_journal_entry(entry_nil)
    refute invalid_changeset.valid?
  end

  test "create_journal_entry/1 with no title throws an error" do
    title_nil = %{author: "Author", entry: "Entry", title: nil}

    assert {:error, invalid_changeset} = EChronicler.Models.JournalEntry.create_journal_entry(title_nil)
    refute invalid_changeset.valid?
  end

  test "change_journal_entry/1 returns a journal_entry changeset" do
    assert {:ok, %JournalEntry{} = journal_entry} = EChronicler.Models.JournalEntry.create_journal_entry(@valid_journal_entry)

    assert %Ecto.Changeset{} = JournalEntry.change_journal_entry(journal_entry)
  end

end
