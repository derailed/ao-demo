defmodule Store.Draw do
  use Store.Model

  schema "draws" do
    belongs_to :event  , Event
    has_many   :matches, Match

    field :round, :string

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:round])
    |> validate_required([:round])
  end

  def by(id: id) do
    Draw
    |> where([d], d.id == ^id)
    |> Repo.one
    |> Repo.preload(:matches)
    |> case do
      nil -> {:error, "No draw found with id #{id}"}
      rec -> {:ok, rec}
    end
  end
  def by(event_id, round: round) do
    Draw
    |> where([d], d.event_id == ^event_id and d.round == ^round)
    |> Repo.all
    |> case do
      nil   -> {:error, "No draw found with round #{round}"}
      draws -> {:ok, draws}
    end
  end

  def first(event_id, count) do
    Draw
    |> where([d], d.event_id == ^event_id)
    |> limit(^count)
    |> Repo.all
    |> case do
      nil  -> {:error, "No draw found"}
      rows -> {:ok, rows}
    end
  end

  def all(event_id) do
    Draw
    |> where([d], d.event_id == ^event_id)
    |> Repo.all
    |> case do
      nil   -> {:error, "No draws found"}
      draws -> {:ok, draws}
    end
  end

  def clear do
    Repo.delete_all(__MODULE__)
  end

  def all do
    {:ok, Repo.all(__MODULE__)}
  end
end