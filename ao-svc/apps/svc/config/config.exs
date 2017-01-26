use Mix.Config

config :svc, Svc.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "2pr4wR4b4HQZTZf6/PedekRqYhdRo/OuNSRgWGd3SiVriYh4lp6moaywSbpEqQTU",
  render_errors: [view: Svc.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Svc.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

import_config "#{Mix.env}.exs"
