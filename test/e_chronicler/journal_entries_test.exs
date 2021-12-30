defmodule EChronicler.JournalEntriesTest do
  use EChronicler.DataCase, async: true
  import Ecto.Query, warn: false

  alias EChronicler.JournalEntries
  alias EChronicler.Models.JournalEntry

  test "list_journal_entries/0 returns all journal_entries" do
    {:ok, journal_entry_one} = EChronicler.Models.JournalEntry.create_journal_entry(%{author: "Bob", title: "Hello", entry: "Test."})
    {:ok, journal_entry_two} = EChronicler.Models.JournalEntry.create_journal_entry(%{author: "Betty", title: "Goodbye", entry: "Test."})
    assert JournalEntries.list_journal_entries() == [journal_entry_two, journal_entry_one]
  end

  test "list_journal_entries/0 lists journal entries in reverse chronological order from date, time, and microsecond of entry" do
    {:ok, journal_entry_1} = JournalEntry.create_journal_entry(%{author: "Tiny", title: "1", entry: "1"})
    {:ok, journal_entry_2} = JournalEntry.create_journal_entry(%{author: "Tiny", title: "2", entry: "2"})
    {:ok, journal_entry_3} = JournalEntry.create_journal_entry(%{author: "Tino", title: "3", entry: "3"})
    {:ok, journal_entry_4} = JournalEntry.create_journal_entry(%{author: "Tino", title: "4", entry: "4"})
    {:ok, journal_entry_5} = JournalEntry.create_journal_entry(%{author: "Tina", title: "5", entry: "5"})
    assert JournalEntries.list_journal_entries() == [journal_entry_5, journal_entry_4, journal_entry_3, journal_entry_2, journal_entry_1]
  end


end
