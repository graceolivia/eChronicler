defmodule EChronicler.JournalEntries do
  import Ecto.Query, warn: false

  alias EChronicler.Repo
  alias EChronicler.EChronicler.JournalEntry

  def list_journal_entries() do
    Repo.all(JournalEntry)
    |> Enum.sort(&(&1.inserted_at > &2.inserted_at))
  end


end
