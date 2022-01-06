defmodule EChronicler.Repo.Migrations.IncreasePostLimit do
  use Ecto.Migration

  def change do
    alter table(:journal_entries) do
      modify :entry, :string, size: 10485760
    end
  end
end
