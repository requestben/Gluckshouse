defmodule Gluckshaus.Repo do
  use Ecto.Repo,
    otp_app: :gluckshaus,
    adapter: Ecto.Adapters.SQLite3
end
