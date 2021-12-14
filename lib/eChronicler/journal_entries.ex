defmodule EChronicler.JournalEntries do
  import Ecto.Query, warn: false

  alias EChronicler.Repo
  alias EChronicler.EChronicler.Journal_Entry

  def list_journal_entries() do
    Repo.all(Journal_Entry)
  end

  # def create_garden(attrs \\ %{}) do
  #   %Garden{}
  #   |> Garden.changeset(attrs)
  #   |> Repo.insert()
  # end

end
