defmodule EChronicler.EChronicler.JournalEntry  do
  use EChronicler.DataCase, async: true
  import Ecto.Query, warn: false

  alias EChronicler.JournalEntries
  alias EChronicler.JournalEntries.JournalEntry

  test "format_datetime/1 returns formatted string if correct" do
    {:ok, correct_datetime} = %EChronicler.EChronicler.Journal_Entry{title: "Awesome Blog Post", author: "Grace", entry: "Test.", inserted_at: "2021-12-14 21:51:06"}
    assert %EChronicler.EChronicler.Journal_Entry.format_datetime() == :ok
  end

  test "format_datetime/1 returns error if incorrect" do
    {:ok, correct_datetime} = %EChronicler.EChronicler.Journal_Entry{title: "Awesome Blog Post", author: "Grace", entry: "Test.", inserted_at: ""}
    assert %EChronicler.EChronicler.Journal_Entry.format_datetime() == :error
  end

end
