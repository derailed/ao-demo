defmodule Ql.Schema do
  use Absinthe.Schema

  alias Ql.Resolver

  import_types Ql.Schema.Types

  query do
    @desc "Get championship event by id"
    field :event, :event do
      arg     :id, non_null(:id)
      resolve &Resolver.Event.by/3
    end

    @desc "Get championship event by name/year"
    field :event_by_name, :event do
      arg     :name, non_null(:string)
      arg     :year, non_null(:integer)
      resolve &Resolver.Event.by/3
    end

    @desc "Get all championship events"
    field :events, list_of(:event) do
      resolve &Resolver.Event.all/3
    end

    @desc "Fetch all players"
    field :players, list_of(:player) do
      resolve &Resolver.Player.all/3
    end

    @desc "Fetch player by name"
    field :player, :player do
      arg     :name, non_null(:string)
      resolve &Resolver.Player.by/3
    end

    @desc "Fetch all matches"
    field :matches, list_of(:match) do
      resolve &Resolver.Match.all/3
    end
  end

  @desc "Form object for rankings"
  input_object :ranking_input do
    field :rank, non_null(:integer)
  end

  @desc "Form object for players"
  input_object :player_input do
    field :name   , non_null(:string)
    field :age    , non_null(:integer)
    field :gender , non_null(:gender_code)
    field :country, non_null(:country_code)
    field :ranking, non_null(:ranking_input)
  end

  mutation do
    @desc "Create a new ranking"
    field :create_ranking, :ranking do
      arg :rank, non_null(:integer)
    end

    @desc "Create a new player"
    field :create_player, :player do
      arg     :player, non_null(:player_input)
      resolve &Resolver.Player.create/3
    end
  end
end
