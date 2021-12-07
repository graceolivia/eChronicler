defmodule EChronicler.Repo.Migrations.CreateEntries do
  use Ecto.Migration

  def change do
    create table(:entries) do
      add :author, :string
      add :title, :string

      timestamps()
    end
  end
end
