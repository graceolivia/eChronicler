defmodule EChroniclerWeb.PageControllerTest do
  use EChroniclerWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Journal Entries"
  end


end
