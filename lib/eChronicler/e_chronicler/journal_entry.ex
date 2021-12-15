defmodule EChronicler.EChronicler.JournalEntry do
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

  def format_datetime(journal_entry) do
    journal_entry.inserted_at
    |> Timex.format("{h12}:{m}, {Mfull} {D}, {YYYY}")
    |> case do
      {:ok, formatted_date} -> formatted_date
      {:error, _} -> "no date found"
    end
  end


  # create error checker for correct datetime strings to avoid errors
  @doc false
  def changeset(journal_entry, attrs) do
    journal_entry
    |> cast(attrs, [:author, :title, :entry])
    |> validate_required([:author, :title, :entry])
  end
end
