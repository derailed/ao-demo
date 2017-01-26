use Mix.Config

config :logger, level: :debug

config :store, Store.Repo,
  adapter:   Ecto.Adapters.Postgres,
  username:  System.get_env("PG_USER"),
  password:  System.get_env("PG_PASSWORD"),
  database:  "ao_#{Mix.env}",
  hostname:  System.get_env("AO_DB_SERVICE_HOST"),
  port:      Integer.parse(System.get_env("AO_DB_SERVICE_PORT") || "5432") |> elem(0),
  pool:      Ecto.Adapters.SQL.Sandbox