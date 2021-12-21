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
    {:ok, journal_entry_1} = JournalEntries.create_journal_entry(%{author: "Tiny", title: "1", entry: "1"})
    {:ok, journal_entry_2} = JournalEntries.create_journal_entry(%{author: "Tiny", title: "2", entry: "2"})
    {:ok, journal_entry_3} = JournalEntries.create_journal_entry(%{author: "Tino", title: "3", entry: "3"})
    {:ok, journal_entry_4} = JournalEntries.create_journal_entry(%{author: "Tino", title: "4", entry: "4"})
    {:ok, journal_entry_5} = JournalEntries.create_journal_entry(%{author: "Tina", title: "5", entry: "5"})
    assert JournalEntries.reverse_chron_list_journal_entries() == [journal_entry_5, journal_entry_4, journal_entry_3, journal_entry_2, journal_entry_1]
  end

  test "truncate_journal_entry/1 truncates entry" do
    assert JournalEntries.truncate_journal_entry("Time is an illusion. Teatime doubly so. And time for tennis? Forget about it.") == "Time is an illusion. Teatime doubly so. And time fo..."
  end

end
