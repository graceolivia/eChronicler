defmodule EChronicler.JournalEntriesTest do
  use EChronicler.DataCase, async: true
  import Ecto.Query, warn: false

  alias EChronicler.JournalEntries
  alias EChronicler.EChronicler.JournalEntry

  test "list_journal_entries/0 returns all journal_entries" do
    {:ok, journal_entry_one} = JournalEntries.create_journal_entry(%{author: "Bob", title: "Hello", entry: "Test."})
    {:ok, journal_entry_two} = JournalEntries.create_journal_entry(%{author: "Betty", title: "Goodbye", entry: "Test."})
    assert JournalEntries.list_journal_entries() == [journal_entry_one, journal_entry_two]
  end

end
