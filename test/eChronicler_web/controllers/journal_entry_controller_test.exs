defmodule EChroniclerWeb.JournalEntryControllerTest do
  use EChroniclerWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Journal Entries"
  end

  test "All Journal Entries are Displayed at /", %{conn: conn} do
    {:ok, journal_entry_one} = EChronicler.JournalEntries.create_journal_entry(%{author: "Bob", title: "Hello", entry: "Test."})
    {:ok, journal_entry_two} = EChronicler.JournalEntries.create_journal_entry(%{author: "Betty", title: "Goodbye", entry: "Test."})
    {:ok, journal_entry_two} = EChronicler.JournalEntries.create_journal_entry(%{author: "Booboo", title: "Supercilious", entry: "Test."})

    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Hello"
    assert html_response(conn, 200) =~ "Goodbye"
    assert html_response(conn, 200) =~ "Supercilious"
  end


end
