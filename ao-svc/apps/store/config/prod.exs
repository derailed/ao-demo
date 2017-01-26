use Mix.Config

config :store, Store.Repo,
  adapter:   Ecto.Adapters.Postgres,
  username:  System.get_env("PG_USER"),
  password:  System.get_env("PG_PASSWORD"),
  database:  "ao_#{Mix.env}",
  hostname:  "ao-db",
  port:      5432,
  pool_size: 20