defmodule EChronicler.JournalEntriesTest do
  use EChronicler.DataCase, async: true
  import Ecto.Query, warn: false

  alias EChronicler.JournalEntries

  test "list_journal_entries/0 returns all journal_entries" do
    {:ok, journal_entry_one} = JournalEntries.create_journal_entry(%{author: "Bob", title: "Hello", entry: "Test."})
    {:ok, journal_entry_two} = JournalEntries.create_journal_entry(%{author: "Betty", title: "Goodbye", entry: "Test."})
    assert JournalEntries.list_journal_entries() == [journal_entry_one, journal_entry_two]
  end

  test "reverse_chron_list_journal_entries/0 lists journal entries in reverse chronological order" do
    {:ok, journal_entry_earliest} = JournalEntries.create_journal_entry(%{author: "Tiny", title: "Published Earliest", entry: "Test.", inserted_at: ~U[1990-12-16 16:36:15.549610Z]})
    {:ok, journal_entry_earlier} = JournalEntries.create_journal_entry(%{author: "Tino", title: "Published Earlier", entry: "Test.", inserted_at: ~U[2020-12-16 16:36:15.549610Z]})
    {:ok, journal_entry_latest} = JournalEntries.create_journal_entry(%{author: "Tina", title: "Published Latest", entry: "Test.", inserted_at: ~U[2021-12-16 16:36:15.549610Z]})
    assert JournalEntries.reverse_chron_list_journal_entries() == [journal_entry_latest, journal_entry_earlier, journal_entry_earliest]
  end


end
