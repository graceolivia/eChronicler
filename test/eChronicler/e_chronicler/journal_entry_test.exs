defmodule EChronicler.EChronicler.JournalEntryTest  do
  use EChronicler.DataCase, async: true
  import Ecto.Query, warn: false

  alias EChronicler.EChronicler.JournalEntries
  alias EChronicler.EChronicler.JournalEntry

  test "format_datetime/1 returns formatted string if correct" do
    correct_datetime = %EChronicler.EChronicler.JournalEntry{title: "Awesome Blog Post", author: "Grace", entry: "Test.", inserted_at: "2021-12-14 10:51:06"}
    IO.inspect(correct_datetime)
    assert JournalEntry.format_datetime(correct_datetime) == "10:51, December 14, 2021"
  end

  test "format_datetime/1 returns error if incorrect" do
    incorrect_datetime = %EChronicler.EChronicler.JournalEntry{title: "Awesome Blog Post", author: "Grace", entry: "Test.", inserted_at: ""}
    assert JournalEntry.format_datetime(incorrect_datetime)  == "no date found"
  end

end
