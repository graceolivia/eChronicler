defmodule EChroniclerWeb.JournalEntryControllerTest do
  use EChroniclerWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Journal Entries"
  end

  test "All Journal Entries are Displayed at /", %{conn: conn} do
    {:ok, _journal_entry_one} = EChronicler.Models.JournalEntry.create_journal_entry(%{author: "Bob", title: "Hello", entry: "Test."})
    {:ok, _journal_entry_two} = EChronicler.Models.JournalEntry.create_journal_entry(%{author: "Betty", title: "Goodbye", entry: "Test."})
    {:ok, _journal_entry_three} = EChronicler.Models.JournalEntry.create_journal_entry(%{author: "Booboo", title: "Supercilious", entry: "Test."})

    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Hello"
    assert html_response(conn, 200) =~ "Goodbye"
    assert html_response(conn, 200) =~ "Supercilious"
  end

  test "Single Journal Entry Is Displayed At /:id", %{conn: conn} do
    {:ok, journal_entry} = EChronicler.Models.JournalEntry.create_journal_entry(%{author: "Bob", title: "Hello", entry: "Test."})
    {:ok, _journal_entry_irrelevant} = EChronicler.Models.JournalEntry.create_journal_entry(%{author: "Betty", title: "Goodbye", entry: "Test."})
    conn = get(conn, "/#{journal_entry.id}")
    assert html_response(conn, 200) =~ "Hello"
    assert !String.contains?(html_response(conn, 200), "Goodbye")
  end

end
