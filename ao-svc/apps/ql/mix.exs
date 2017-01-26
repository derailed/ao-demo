defmodule Ql.Mixfile do
  use Mix.Project

  def project do
    [
      app:             :ql,
      version:         "0.1.0",
      build_path:      "../../_build",
      config_path:     "../../config/config.exs",
      deps_path:       "../../deps",
      lockfile:        "../../mix.lock",
      elixir:          "~> 1.3",
      build_embedded:  Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps:            deps
    ]
  end

def application do
    [
      applications: [
        :logger,
        :store,
        :tzdata,
        :absinthe_plug
      ]
    ]
  end

  defp deps do
    [
      {:absinthe     , "~> 1.2.0-rc.0", override: true},
      {:absinthe_plug, "~> 1.2.0-rc.0"},
      {:absinthe_ecto, git: "https://github.com/absinthe-graphql/absinthe_ecto.git"},
      {:timex        , ">= 0.0.0"},
      {:tzdata       , "~> 0.1.8", override: true},
      {:store        , in_umbrella: true}
    ]
  end
end
