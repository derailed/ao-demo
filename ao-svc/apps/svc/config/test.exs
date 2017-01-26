use Mix.Config

config :svc, Svc.Endpoint,
  http: [port: 4001],
  server: false

config :logger, level: :warn
