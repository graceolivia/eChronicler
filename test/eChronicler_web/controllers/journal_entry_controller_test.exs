defmodule EChroniclerWeb.JournalEntryControllerTest do
  use EChroniclerWeb.ConnCase

  test "GET /journal_entries", %{conn: conn} do
    conn = get(conn, "/journal_entries")
    assert html_response(conn, 200) =~ "Journal Entries Page"
  end
end
