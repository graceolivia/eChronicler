defmodule EChronicler.EChronicler.Journal_Entry do
  use Ecto.Schema
  import Ecto.Changeset
 # module JournalEntry should not be Snake Cased - convention note
  schema "journal_entries" do
    field :author, :string
    # field :publish_date, :utc_datetime
    field :entry, :string
    field :title, :string
    # make sure this is in UTC before re-adding publish_date
    timestamps()
  end

  @doc false
  def changeset(journal_entry, attrs) do
    journal_entry
    |> cast(attrs, [:author, :title, :entry])
    # |> validate_required([:author, :title, :entry, :publish_date])
    |> validate_required([:author, :title, :entry])
  end
end
