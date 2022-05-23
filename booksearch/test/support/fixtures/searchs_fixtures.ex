defmodule Booksearch.SearchsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Booksearch.Searchs` context.
  """

  @doc """
  Generate a search.
  """
  def search_fixture(attrs \\ %{}) do
    {:ok, search} =
      attrs
      |> Enum.into(%{
        language: "some language",
        publish_date: "some publish_date",
        publish_year: 42,
        seeds: "some seeds",
        title: "some title"
      })
      |> Booksearch.Searchs.create_search()

    search
  end
end
