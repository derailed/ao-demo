defmodule Ql.Resolver.Draw do
  alias Store.Draw

  def all(_event, _args, _ctx) do
    Draw.all
  end

  def by(event, %{round: round}, _ctx) do
    Draw.by(event.id, round: round)
  end
  def by(event, %{}, _ctx) do
    Draw.all(event.id)
  end

  def limit(event, args, _ctx) do
    Draw.first(event.id, args.first)
  end
end
