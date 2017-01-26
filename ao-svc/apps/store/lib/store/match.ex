defmodule Store.Match do
  use Store.Model

  schema "matches" do
    belongs_to :p1  , Player
    belongs_to :p2  , Player
    belongs_to :draw, Draw

    field :court, :string
    field :score, {:array, :integer}

    timestamps()
  end

  def clear do
    Repo.delete_all(__MODULE__)
  end

  def first(draw_id, count) do
    Match
    |> where([m], m.draw_id == ^draw_id)
    |> limit(^count)
    |> Repo.all
    |> case do
      nil  -> {:error, "No matches found"}
      rows -> {:ok, rows}
    end
  end

  def all(draw_id) do
    Match
    |> where([m], m.draw_id == ^draw_id)
    |> Repo.all
    |> case do
      nil  -> {:error, "No matches found"}
      rows -> {:ok, rows}
    end
  end

  def all do
    {:ok, Repo.all(__MODULE__) |> Repo.preload(:p1) |> Repo.preload(:p2)}
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:p1, :p2, :court, :score])
    |> validate_required([:p1, :p2, :score, :court])
  end
end