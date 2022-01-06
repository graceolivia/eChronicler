defmodule EChronicler.Repo.Migrations.ChangeEntryType do
  use Ecto.Migration

  def change do
    alter table(:journal_entries) do
      modify :entry, :text
    end
  end
end
