defmodule Booksearch.Searchs.Search do
  use Ecto.Schema
  import Ecto.Changeset

  schema "search" do
    field :language, :string
    field :publish_date, :string
    field :publish_year, :integer
    field :seeds, :string
    field :title, :string
    field :author, :string
    field :subject, :string


    timestamps()
  end

  @doc false
  def changeset(search, attrs) do
    search
    |> cast(attrs, [:title, :seeds, :publish_date, :publish_year, :language])
    |> validate_required([:title, :seeds, :publish_date, :publish_year, :language])
  end

  def send_to_bookapi(query) do

  end

  def convert_query(string) when string == " ", do: "Not an acceptable query, Please try again."

  def convert_query(string) do
    string
    |> String.downcase
    |> String.replace(" ", "+")
  end
end
