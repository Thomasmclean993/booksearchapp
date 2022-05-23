defmodule Booksearch.SearchsTest do
  use Booksearch.DataCase

  alias Booksearch.Searchs

  describe "convert_query/1" do
    test "Successfully convert a query to the correct format" do

    end

    test "converts a single word response" do

    end

    test "converts a empty response without adding unnecessary +" do

    end
  end

  describe "search" do
    alias Booksearch.Searchs.Search

    import Booksearch.SearchsFixtures

    @invalid_attrs %{language: nil, publish_date: nil, publish_year: nil, seeds: nil, title: nil}

    test "list_search/0 returns all search" do
      search = search_fixture()
      assert Searchs.list_search() == [search]
    end

    test "get_search!/1 returns the search with given id" do
      search = search_fixture()
      assert Searchs.get_search!(search.id) == search
    end

    test "create_search/1 with valid data creates a search" do
      valid_attrs = %{language: "some language", publish_date: "some publish_date", publish_year: 42, seeds: "some seeds", title: "some title"}

      assert {:ok, %Search{} = search} = Searchs.create_search(valid_attrs)
      assert search.language == "some language"
      assert search.publish_date == "some publish_date"
      assert search.publish_year == 42
      assert search.seeds == "some seeds"
      assert search.title == "some title"
    end

    test "create_search/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Searchs.create_search(@invalid_attrs)
    end

    test "update_search/2 with valid data updates the search" do
      search = search_fixture()
      update_attrs = %{language: "some updated language", publish_date: "some updated publish_date", publish_year: 43, seeds: "some updated seeds", title: "some updated title"}

      assert {:ok, %Search{} = search} = Searchs.update_search(search, update_attrs)
      assert search.language == "some updated language"
      assert search.publish_date == "some updated publish_date"
      assert search.publish_year == 43
      assert search.seeds == "some updated seeds"
      assert search.title == "some updated title"
    end

    test "update_search/2 with invalid data returns error changeset" do
      search = search_fixture()
      assert {:error, %Ecto.Changeset{}} = Searchs.update_search(search, @invalid_attrs)
      assert search == Searchs.get_search!(search.id)
    end

    test "delete_search/1 deletes the search" do
      search = search_fixture()
      assert {:ok, %Search{}} = Searchs.delete_search(search)
      assert_raise Ecto.NoResultsError, fn -> Searchs.get_search!(search.id) end
    end

    test "change_search/1 returns a search changeset" do
      search = search_fixture()
      assert %Ecto.Changeset{} = Searchs.change_search(search)
    end
  end
end
