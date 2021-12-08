defmodule EChronicler.EChronicler.Journal_Entry do
  use Ecto.Schema
  import Ecto.Changeset

  schema "journal_entries" do
    field :author, :string
    field :datetime, :utc_datetime
    field :entry, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(journal__entry, attrs) do
    journal__entry
    |> cast(attrs, [:author, :title, :entry, :datetime])
    |> validate_required([:author, :title, :entry, :datetime])
  end
end
