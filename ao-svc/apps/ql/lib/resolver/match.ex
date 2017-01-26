defmodule Ql.Resolver.Match do
  alias Store.Match

  def all(_parent, _args, _ctx) do
    Match.all
  end

  def limit(draw, %{first: n}, _ctx) do
    Match.first(draw.id, n)
  end
  def limit(draw, %{}, _ctx) do
    Match.all(draw.id)
  end
end
