defmodule Booksearch.Repo do
  use Ecto.Repo,
    otp_app: :booksearch,
    adapter: Ecto.Adapters.Postgres
end
