defmodule EChroniclerWeb.JournalEntryController do
  use EChroniclerWeb, :controller

  alias EChronicler.JournalEntries
  alias EChronicler.Models.JournalEntry

  @empty_entry_field_error "Empty entry field"
  def empty_entry_field_error, do: @empty_entry_field_error

  def index(conn, _params) do
    journal_entries = JournalEntries.list_journal_entries()
    render(conn, "index.html", journal_entries: journal_entries)
  end

  def show(conn, %{"id" => id}) do
    case JournalEntry.get_journal_entry(id) do
      nil ->
        conn
        |> put_status(:not_found)
        |> put_view(EChroniclerWeb.ErrorView)
        |> render(:"404")
      entry -> render(conn, "show.html", entry: entry)
    end
  end

  def new(conn, params) do
    changeset = JournalEntry.changeset(%JournalEntry{}, params)
    render(conn, "new.html", changeset: changeset)
  end



  def create(conn, %{"journal_entry" => journal_entry_params}) do
    case JournalEntry.create_journal_entry(journal_entry_params) do
      {:ok, journal_entry} ->
        conn
        |> redirect(to: Routes.journal_entry_path(conn, :show, journal_entry))

      {:error, _changeset} ->
        conn
        |> put_status(:bad_request)
        |> put_view(EChroniclerWeb.ErrorView)
        |> render(:"400", reason: @empty_entry_field_error)
    end
  end

  def edit(conn, %{"id" => id}) do
    journal_entry = JournalEntry.get_journal_entry(id)
    changeset = JournalEntry.change_journal_entry(journal_entry)
    render(conn, "edit.html", journal_entry: journal_entry, changeset: changeset)
  end

  def update(conn, %{"id" => id, "journal_entry" => journal_entry_params}) do
    journal_entry = JournalEntry.get_journal_entry(id)

    case JournalEntry.update_journal_entry(journal_entry, journal_entry_params) do
      {:ok, journal_entry} ->
        conn
        |> redirect(to: Routes.journal_entry_path(conn, :show, journal_entry))

        {:error, _changeset} ->
          conn
          |> put_status(:bad_request)
          |> put_view(EChroniclerWeb.ErrorView)
          |> render(:"400", reason: @empty_entry_field_error)
    end
  end

end
