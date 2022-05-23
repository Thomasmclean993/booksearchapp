defmodule BooksearchWeb.SearchController do
  use BooksearchWeb, :controller

  alias Booksearch.Searchs
  alias Booksearch.Searchs.Search

  def index(conn, _params) do
    search = Searchs.list_search()
    render(conn, "index.html", search: search)
  end

  def new(conn, _params) do
    changeset = Searchs.change_search(%Search{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"search" => search_params}) do
    case Searchs.create_search(search_params) do
      {:ok, search} ->
        conn
        |> put_flash(:info, "Search created successfully.")
        |> redirect(to: Routes.search_path(conn, :show, search))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    search = Searchs.get_search!(id)
    render(conn, "show.html", search: search)
  end

  def edit(conn, %{"id" => id}) do
    search = Searchs.get_search!(id)
    changeset = Searchs.change_search(search)
    render(conn, "edit.html", search: search, changeset: changeset)
  end

  def update(conn, %{"id" => id, "search" => search_params}) do
    search = Searchs.get_search!(id)

    case Searchs.update_search(search, search_params) do
      {:ok, search} ->
        conn
        |> put_flash(:info, "Search updated successfully.")
        |> redirect(to: Routes.search_path(conn, :show, search))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", search: search, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    search = Searchs.get_search!(id)
    {:ok, _search} = Searchs.delete_search(search)

    conn
    |> put_flash(:info, "Search deleted successfully.")
    |> redirect(to: Routes.search_path(conn, :index))
  end
end
