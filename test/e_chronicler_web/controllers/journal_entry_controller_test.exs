defmodule EChroniclerWeb.JournalEntryControllerTest do
  use EChroniclerWeb.ConnCase
  alias EChroniclerWeb.JournalEntryController

  @valid_journal_attrs %{title: "Awesome Blog Post", author: "Grace", entry: "Time is an illustion, teatime doubly so."}
  @invalid_journal_attrs %{title: "", author: "", entry: ""}
  @updated_journal_attrs %{author: "some updated author", entry: "some updated entry", title: "some updated title"}
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
    conn = get(conn, "/journal_entry/#{journal_entry.id}")
    assert html_response(conn, 200) =~ journal_entry.title
    refute html_response(conn, 200) =~ other_journal_entry.title
  end

  test "Return 404 if Entry Is Not Found at /:id", %{conn: conn} do
    conn = get(conn, "/journal_entry/5")
    assert html_response(conn, 404)
  end

  test "renders form", %{conn: conn} do
    conn = get(conn, "/journal_entry/new")
    assert html_response(conn, 200) =~ "<form action=\"/journal_entry\" method=\"post\">"
  end


  test "Redirects to show journal entry when data is valid", %{conn: conn} do
    conn = post(conn, Routes.journal_entry_path(conn, :create), journal_entry: @valid_journal_attrs)

    assert %{id: id} = redirected_params(conn)
    assert redirected_to(conn) == Routes.journal_entry_path(conn, :show, id)

    conn = get(conn, Routes.journal_entry_path(conn, :show, id))
    assert html_response(conn, 200) =~ "Awesome Blog Post"
  end

  test "Redirects to 400 error page when journal entry when data is invalid", %{conn: conn} do
    conn = post(conn, Routes.journal_entry_path(conn, :create), journal_entry: @invalid_journal_attrs)
    assert html_response(conn, 400) =~ JournalEntryController.empty_entry_field_error
  end



  test "renders form for editing chosen journal_entry", %{conn: conn} do
    {:ok, journal_entry} = EChronicler.Models.JournalEntry.create_journal_entry(@valid_journal_attrs)
    conn = get(conn, Routes.journal_entry_path(conn, :edit, journal_entry))
    assert html_response(conn, 200) =~ "Edit Journal Entry"
  end

  test "update redirects when data is valid", %{conn: conn} do
    {:ok, journal_entry} = EChronicler.Models.JournalEntry.create_journal_entry(@valid_journal_attrs)
    conn = put(conn, Routes.journal_entry_path(conn, :update, journal_entry), journal_entry: @updated_journal_attrs)
    assert redirected_to(conn) == Routes.journal_entry_path(conn, :show, journal_entry)

    conn = get(conn, Routes.journal_entry_path(conn, :show, journal_entry))
    assert html_response(conn, 200) =~ "some updated author"
  end

  test "journal entry is updated successfully after update", %{conn: conn} do
    {:ok, journal_entry} = EChronicler.Models.JournalEntry.create_journal_entry(@valid_journal_attrs)
    conn = put(conn, Routes.journal_entry_path(conn, :update, journal_entry), journal_entry: @updated_journal_attrs)

    conn = get(conn, Routes.journal_entry_path(conn, :show, journal_entry))
    assert html_response(conn, 200) =~ "some updated author"
  end

  test "update renders errors when data is invalid", %{conn: conn} do
    {:ok, journal_entry} = EChronicler.Models.JournalEntry.create_journal_entry(@valid_journal_attrs)
    conn = put(conn, Routes.journal_entry_path(conn, :update, journal_entry), journal_entry: @invalid_journal_attrs)
    assert html_response(conn, 400) =~ JournalEntryController.empty_entry_field_error
  end

  test "deletes chosen journal_entry", %{conn: conn} do
    {:ok, journal_entry} = EChronicler.Models.JournalEntry.create_journal_entry(@valid_journal_attrs)
    conn = delete(conn, Routes.journal_entry_path(conn, :delete, journal_entry))
    assert redirected_to(conn) == Routes.journal_entry_path(conn, :index)

    conn = get(conn, "/journal_entry/#{journal_entry.id}")
    assert html_response(conn, 404)
  end

end
