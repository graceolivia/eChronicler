defmodule EChroniclerWeb.JournalEntryController do
  use EChroniclerWeb, :controller

  alias EChronicler.JournalEntries

  def index(conn, _params) do
    journal_entries = JournalEntries.list_journal_entries()
    render(conn, "index.html", journal_entries: journal_entries)
  end

  def show(conn, %{"id" => id}) do
    entry = Timeline.get_entry!(id)
    render(conn, "show.html", entry: entry)
  end


end
