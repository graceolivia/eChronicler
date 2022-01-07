defmodule EChroniclerWeb.JournalEntryControllerTest do
  use EChroniclerWeb.ConnCase

  @valid_journal_entry %{title: "Awesome Blog Post", author: "Grace", entry: "Time is an illustion, teatime doubly so."}

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
    {:ok, other_journal_entry} = EChronicler.Models.JournalEntry.create_journal_entry(%{author: "Betty", title: "Goodbye", entry: "Test."})
    conn = get(conn, "/post/#{journal_entry.id}")
    assert html_response(conn, 200) =~ journal_entry.title
    refute html_response(conn, 200) =~ other_journal_entry.title
  end

  test "Return 404 if Entry Is Not Found at /:id", %{conn: conn} do
    conn = get(conn, "/post/5")
    assert html_response(conn, 404)
  end


  test "New journal entry renders form", %{conn: conn} do
    conn = get(conn, "/new")
    assert html_response(conn, 200) =~ "Write New Post"
  end

  test "Redirects to show journal entry when data is valid", %{conn: conn} do
    conn = post(conn, Routes.journal_entry_path(conn, :create), journal_entry: @valid_journal_entry)

    assert %{id: id} = redirected_params(conn)
    assert redirected_to(conn) == Routes.journal_entry_path(conn, :show, id)

    conn = get(conn, Routes.journal_entry_path(conn, :show, id))
    assert html_response(conn, 200) =~ "Awesome Blog Post"
  end

end
