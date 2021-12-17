defmodule EChroniclerWeb.JournalEntryControllerTest do
  use EChroniclerWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Journal Entries"
  end

  test "Journal Entries are Displayed at /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Title:"
  end


end
