defmodule EChronicler.Repo.Migrations.AddJournalTable do
  use Ecto.Migration

def change do
  create table(:journal_entries) do
    add :title, :string
    add :author, :string
    add :entry, :string
    add :datetime, :utc_datetime

    timestamps()
  end

  end
end
