defmodule EChronicler.JournalEntries do
  import Ecto.Query, warn: false

  alias EChronicler.Repo
  alias EChronicler.EChronicler.JournalEntry

  def list_journal_entries() do
    Repo.all(JournalEntry)
  end

  def reverse_chron_list_journal_entries() do
    Repo.all(JournalEntry)
    |> Enum.sort(&(&1.inserted_at > &2.inserted_at))
  end

  def create_journal_entry(attrs \\ %{}) do
    %JournalEntry{}
    |> JournalEntry.changeset(attrs)
    |> Repo.insert()
  end

  def truncate_journal_entry(entry) do
    sliced = String.slice(entry, 0..50)
    sliced <> "..."
  end

end
