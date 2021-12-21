defmodule EChronicler.Repo.Migrations.CreateJournalEntries do
  use Ecto.Migration

  def change do
    create table(:journal_entries) do
      add :author, :string
      add :title, :string
      add :entry, :string

      timestamps([type: :utc_datetime_usec])
    end
  end
end
