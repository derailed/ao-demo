use Mix.Config

config :svc, Svc.Endpoint,
  http: [port: {:system, "HTTP_PORT"}],
  url: [host: "example.com", port: 80],
  cache_static_manifest: "priv/static/manifest.json"

config :logger, level: :debug

import_config "prod.secret.exs"
