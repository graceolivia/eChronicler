defmodule EChroniclerWeb.JournalEntryController do
  use EChroniclerWeb, :controller

  def index(conn, _params) do
    journal_entries = [%EChronicler.EChronicler.Journal_Entry{title: "Awesome Blog Post", author: "Grace", entry: "Test."},
    %EChronicler.EChronicler.Journal_Entry{title: "Cool Blog Post", author: "Grace", entry: "Test."},
    %EChronicler.EChronicler.Journal_Entry{title: "So-So Blog Post", author: "Grace", entry: "Test."}]

    render(conn, "index.html", journal_entries: journal_entries)
  end

end
