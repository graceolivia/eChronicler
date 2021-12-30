defmodule EChroniclerWeb.JournalEntryController do
  use EChroniclerWeb, :controller

  alias EChronicler.JournalEntries

  def index(conn, _params) do
    journal_entries = JournalEntries.list_journal_entries()
    render(conn, "index.html", journal_entries: journal_entries)
  end

end
