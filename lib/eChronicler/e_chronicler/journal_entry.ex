defmodule EChronicler.EChronicler.JournalEntry do
  use Ecto.Schema
  import Ecto.Changeset
  schema "journal_entries" do
    field :author, :string
    field :entry, :string
    field :title, :string
    timestamps([type: :utc_datetime_usec])
  end

  def format_datetime(journal_entry) do
    journal_entry.inserted_at
    |> Timex.format("{h12}:{m}, {Mfull} {D}, {YYYY}")
    |> case do
      {:ok, formatted_date} -> formatted_date
      {:error, _} -> "no date found"
    end
  end

  @doc false
  def changeset(journal_entry, attrs) do
    journal_entry
    |> cast(attrs, [:author, :title, :entry])
    |> validate_required([:author, :title, :entry])
  end
end
