defmodule Dbtest.Repo do
  use Ecto.Repo,
    otp_app: :dbtest,
    adapter: Ecto.Adapters.Postgres
end
