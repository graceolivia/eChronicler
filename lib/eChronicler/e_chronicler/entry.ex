defmodule EChronicler.EChronicler.Entry do
  use Ecto.Schema
  import Ecto.Changeset

  schema "entries" do
    field :author, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(entry, attrs) do
    entry
    |> cast(attrs, [:author, :title])
    |> validate_required([:author, :title])
  end
end
