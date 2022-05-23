defmodule BooksearchWeb.PageController do
  use BooksearchWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
