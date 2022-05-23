defmodule BooksearchWeb.SearchControllerTest do
  use BooksearchWeb.ConnCase

  import Booksearch.SearchsFixtures

  @create_attrs %{language: "some language", publish_date: "some publish_date", publish_year: 42, seeds: "some seeds", title: "some title"}
  @update_attrs %{language: "some updated language", publish_date: "some updated publish_date", publish_year: 43, seeds: "some updated seeds", title: "some updated title"}
  @invalid_attrs %{language: nil, publish_date: nil, publish_year: nil, seeds: nil, title: nil}

  describe "index" do
    test "lists all search", %{conn: conn} do
      conn = get(conn, Routes.search_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Search"
    end
  end

  describe "new search" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.search_path(conn, :new))
      assert html_response(conn, 200) =~ "New Search"
    end
  end

  describe "create search" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.search_path(conn, :create), search: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.search_path(conn, :show, id)

      conn = get(conn, Routes.search_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Search"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.search_path(conn, :create), search: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Search"
    end
  end

  describe "edit search" do
    setup [:create_search]

    test "renders form for editing chosen search", %{conn: conn, search: search} do
      conn = get(conn, Routes.search_path(conn, :edit, search))
      assert html_response(conn, 200) =~ "Edit Search"
    end
  end

  describe "update search" do
    setup [:create_search]

    test "redirects when data is valid", %{conn: conn, search: search} do
      conn = put(conn, Routes.search_path(conn, :update, search), search: @update_attrs)
      assert redirected_to(conn) == Routes.search_path(conn, :show, search)

      conn = get(conn, Routes.search_path(conn, :show, search))
      assert html_response(conn, 200) =~ "some updated language"
    end

    test "renders errors when data is invalid", %{conn: conn, search: search} do
      conn = put(conn, Routes.search_path(conn, :update, search), search: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Search"
    end
  end

  describe "delete search" do
    setup [:create_search]

    test "deletes chosen search", %{conn: conn, search: search} do
      conn = delete(conn, Routes.search_path(conn, :delete, search))
      assert redirected_to(conn) == Routes.search_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.search_path(conn, :show, search))
      end
    end
  end

  defp create_search(_) do
    search = search_fixture()
    %{search: search}
  end
end
