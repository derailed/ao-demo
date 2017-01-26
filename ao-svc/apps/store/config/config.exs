use Mix.Config

config :logger, level: :debug

config :store, ecto_repos: [Store.Repo]

import_config "#{Mix.env}.exs"