defmodule Ql.Schema.Types do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: Store.Repo

  alias Ql.Resolver

  # ----------------------------------------------
  @desc "Grand Slam Event"
  object :event do
    field :id, :id do
      description "Unique championship id"
    end
    field :name, :string do
      description "Championship event name"
    end
    field :year, :integer do
      description "Event year"
    end
    field :draws, list_of(:draw) do
      description "Championship draws"
      arg         :round, :string
      resolve     &Resolver.Draw.by/3
    end
  end

  # ----------------------------------------------
  @desc "Tennis Player"
  object :player do
    field :id, :id do
      description "Unique player id"
    end
    field :name, :string do
      description "Full name of the player"
    end
    field :age, :integer do
      description "Age of the player"
    end
    field :country, :country_code do
      description "Country of origin"
    end
    field :gender, :gender_code do
      description "Gender male/female"
    end
    field :ranking, :ranking do
      description "ATP Rank"
      resolve     assoc(:ranking)
    end
  end

  # ----------------------------------------------
  @desc "Tournament Draw"
  object :draw do
    field :id, :id do
      description "Unique Draw id"
    end
    field :round, :round_code do
      description "Championship round"
    end
    field :event, :event do
      description "Event associated with draw"
      resolve     assoc(:event)
    end
    field :matches, list_of(:match) do
      description "Current draw matches"
      arg         :first, :integer
      resolve     &Resolver.Match.limit/3
    end
  end

  # ----------------------------------------------
  @desc "Tennis match"
  object :match do
    field :id, :id do
      description "Unique match id"
    end
    field :p1, :player do
      description "Player #1"
      resolve     assoc(:p1)
    end
    field :p2, :player do
      description "Player #2"
      resolve     assoc(:p2)
    end
    field :draw, :draw do
      description "Current draw for match"
      resolve     assoc(:draw)
    end
    field :score, list_of(:integer) do
      description "Current match score"
    end
    field :court, :string do
      description "Match venue"
    end
  end

  # ----------------------------------------------
  @desc "ATP ranking"
  object :ranking do
    field :id, :id do
      description "Unique ranking id"
    end
    field :rank, :integer do
      description "ATP Singles ranking"
    end
  end

  # ----------------------------------------------
  @desc "Enum Round Description"
  enum :round_code do
    value :qf, as: "QF"
    value :sf, as: "SF"
    value :f , as: "F"
  end

  # ----------------------------------------------
  @desc "Enum Player Genders"
  enum :gender_code do
    value :male  , as: "M"
    value :female, as: "F"
  end

  # ----------------------------------------------
  @desc "Enum Player countries"
  enum :country_code do
    value :fra, as: "France"
    value :swi, as: "Switzerland"
    value :ger, as: "Germany"
    value :can, as: "Canada"
    value :bel, as: "Belgium"
    value :esp, as: "Spain"
    value :bul, as: "Bulgaria"
  end
end
