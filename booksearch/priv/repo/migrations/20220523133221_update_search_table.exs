defmodule Booksearch.Repo.Migrations.UpdateSearchTable do
  use Ecto.Migration

  def change do
    alter table(:search) do
      add :author, :string
      add :subject, :string
    end
  end
end
