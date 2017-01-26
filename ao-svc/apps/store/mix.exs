defmodule Store.Mixfile do
  use Mix.Project

  def project do
    [
      app:             :store,
      version:         "0.1.0",
      build_path:      "../../_build",
      config_path:     "../../config/config.exs",
      deps_path:       "../../deps",
      lockfile:        "../../mix.lock",
      elixir:          "~> 1.3",
      elixirc_paths:   elixirc_paths(Mix.env),
      aliases:         aliases(),
      build_embedded:  Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps:            deps
    ]
  end

  def application do
    [
      applications: [
        :logger,
        :ecto,
        :postgrex
      ],
      mod: {Store.Application, []}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_)    , do: ["lib"]

  defp deps do
    [
      {:ecto    , "~> 2.1.1"},
      {:postgrex, ">= 0.13.0"},
    ]
  end

  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate"],
      "ecto.seed":  ["run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      "test":       ["ecto.create --quiet", "ecto.migrate", "test"]
    ]
  end
end
