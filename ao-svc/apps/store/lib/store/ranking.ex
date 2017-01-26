defmodule Store.Ranking do
  use Store.Model

  schema "rankings" do
    has_one :player, Player

    field :rank, :integer

    timestamps()
  end

  def clear do
    Repo.delete_all(__MODULE__)
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:rank])
    |> validate_required([:rank])
  end

  def upsert(attrs) do
    Ranking
    |> where([r], r.rank == ^attrs.rank)
    |> Repo.one
    |> case do
      nil ->
        changeset = Ranking.changeset(%Ranking{}, attrs)
        case Repo.insert_or_update(changeset) do
          {:ok, ranking} -> {:ok, ranking}
          {:error, cs}   -> {:error, cs.errors}
        end
      ranking -> {:ok, ranking}
    end
  end
end
