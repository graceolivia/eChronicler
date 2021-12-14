defmodule EChronicler.EChronicler.Journal_Entry do
  use Ecto.Schema
  import Ecto.Changeset

  schema "journal_entries" do
    field :author, :string
    field :publish_date, :utc_datetime
    field :entry, :string
    field :title, :string
    # make sure this is in UTC before re-adding publish_date
    timestamps()
  end

  @doc false
  def changeset(journal__entry, attrs) do
    journal__entry
    |> cast(attrs, [:author, :title, :entry, :publish_date])
    # |> validate_required([:author, :title, :entry, :publish_date])
    |> validate_required([:author, :title, :entry])
  end
end
