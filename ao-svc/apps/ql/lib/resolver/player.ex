defmodule Ql.Resolver.Player do
  alias Store.Player

  def all(_match, _args, _ctx) do
    Player.all
  end

  def by(_match, %{name: name}, _ctx) do
    Player.by(name: name)
  end

  def create(_match, player, _ctx) do
    Player.create(player)
  end
end
