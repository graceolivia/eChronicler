defmodule EChronicler.JournalEntries do
  import Ecto.Query, warn: false

  alias EChronicler.Repo
  alias EChronicler.EChronicler.JournalEntry

  def list_journal_entries() do
    Repo.all(JournalEntry)
  end

  # def create_garden(attrs \\ %{}) do
  #   %Garden{}
  #   |> Garden.changeset(attrs)
  #   |> Repo.insert()
  # end

end
