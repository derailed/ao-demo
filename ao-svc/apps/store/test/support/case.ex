defmodule Store.Case do
  @moduledoc """
  Setup persistence module requirements
  """
  use ExUnit.CaseTemplate

  using do
    quote do
      alias Store.Repo

      import Ecto
      import Ecto.Changeset
      import Ecto.Query
      import Store.Case

      use Store.Model
    end
  end

  setup tags do
    opts = tags |> Map.take([:isolation]) |> Enum.to_list()
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Store.Repo, opts)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(Store.Repo, {:shared, self()})
    end

    :ok
  end
end
