defmodule EChronicler.EChronicler.JournalEntryTest  do
  use EChronicler.DataCase, async: true
  import Ecto.Query, warn: false

  alias EChronicler.EChronicler.JournalEntry

  test "format_datetime/1 returns formatted string if correct" do
    correct_datetime = %JournalEntry{title: "Awesome Blog Post", author: "Grace", entry: "Test.", inserted_at: ~U[2021-12-16 16:36:15.549610Z]}
    assert JournalEntry.format_datetime(correct_datetime) == "4:36, December 16, 2021"
  end

  test "format_datetime/1 returns error if incorrect" do
    incorrect_datetime = %JournalEntry{title: "Awesome Blog Post", author: "Grace", entry: "Test.", inserted_at: ""}
    assert JournalEntry.format_datetime(incorrect_datetime)  == "no date found"
  end

end
