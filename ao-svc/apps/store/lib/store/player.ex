defmodule Store.Player do
  use Store.Model

  schema "players" do
    belongs_to :ranking, Ranking

    field :name   , :string
    field :age    , :integer
    field :country, :string
    field :gender , :string

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
IO.inspect "PARAMS"
IO.inspect params
    struct
    |> cast(params, [:name, :age, :country, :gender, :ranking_id])
    |> validate_required([:name, :age, :country, :gender, :ranking_id])
  end

  def create(attrs) do
    values = attrs.player
    ranking = values.ranking
    {:ok, rank} = Ranking.upsert(ranking)
    values = values |> Map.put(:ranking_id, rank.id)
    changeset = Player.changeset(%Player{}, values)
    case Repo.insert(changeset) do
      {:ok, player} -> {:ok, player}
      {:error, cs}  -> {:error, cs.errors}
    end
  end

  def by(id: id) do
    Player
    |> where([p], p.id == ^id)
    |> Repo.one
    |> case do
      nil -> {:error, "No #{__MODULE__} found with id #{id}"}
      rec -> {:ok, rec}
    end
  end
  def by(name: name) do
    Player
    |> where([p], p.name == ^name)
    |> Repo.one
    |> case do
      nil -> {:error, "No #{__MODULE__} found with name #{name}"}
      rec -> {:ok, rec}
    end
  end

  def clear do
    Repo.delete_all(__MODULE__)
  end

  def all do
    {:ok, Repo.all(__MODULE__)}
  end
end