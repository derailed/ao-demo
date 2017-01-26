defmodule Ql.Resolver.Event do
  alias Store.Event

  def all(_root, _args, _ctx) do
    Event.all
  end

  def by(_root, %{name: name, year: year}, _ctx) do
    Event.by(name: name, year: year)
  end

  def by(_root, %{id: id}, _ctx) do
    Event.by(id: id)
  end
end
