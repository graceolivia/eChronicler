defmodule EChronicler.Models.JournalEntry do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query, warn: false
  schema "journal_entries" do
    field :author, :string
    field :entry, :string
    field :title, :string
    timestamps([type: :utc_datetime_usec])
  end

  alias EChronicler.Repo
  alias __MODULE__
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

  def truncate_journal_entry_text(entry) when byte_size(entry) <= 50 do
    entry
  end

  def truncate_journal_entry_text(entry) do
    entry
    |> String.slice(0..50)
    |> Kernel.<>("...")
  end

  def create_journal_entry(attrs \\ %{}) do
    changeset(%JournalEntry{}, attrs)
    |> Repo.insert()
  end

  def get_journal_entry(id) do
    Repo.get(JournalEntry, id)
  end

  def change_journal_entry(%JournalEntry{} = journal_entry, attrs \\ %{}) do
    changeset(journal_entry, attrs)
  end


end
