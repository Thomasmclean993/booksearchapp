defmodule Booksearch.Repo.Migrations.CreateSearch do
  use Ecto.Migration

  def change do
    create table(:search) do
      add :title, :string
      add :seeds, :string
      add :publish_date, :string
      add :publish_year, :integer
      add :language, :string

      timestamps()
    end
  end
end
