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

  @spec format_datetime(
          atom
          | %{
              :inserted_at =>
                {{integer, pos_integer, pos_integer},
                 {non_neg_integer, non_neg_integer, non_neg_integer}
                 | {non_neg_integer, non_neg_integer, non_neg_integer,
                    non_neg_integer | {any, any}}}
                | {integer, pos_integer, pos_integer}
                | %{
                    :__struct__ => Date | DateTime | NaiveDateTime | Time,
                    :calendar => atom,
                    optional(:day) => pos_integer,
                    optional(:hour) => non_neg_integer,
                    optional(:microsecond) => {non_neg_integer, non_neg_integer},
                    optional(:minute) => non_neg_integer,
                    optional(:month) => pos_integer,
                    optional(:second) => non_neg_integer,
                    optional(:std_offset) => integer,
                    optional(:time_zone) => binary,
                    optional(:utc_offset) => integer,
                    optional(:year) => integer,
                    optional(:zone_abbr) => binary
                  },
              optional(any) => any
            }
        ) :: binary
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
