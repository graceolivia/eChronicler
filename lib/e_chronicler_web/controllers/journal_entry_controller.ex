defmodule EChroniclerWeb.JournalEntryController do
  use EChroniclerWeb, :controller

  alias EChronicler.JournalEntries
  alias EChronicler.Models.JournalEntry

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

  def create(conn, _params) do
    render(conn, "new.html")
  end


end
