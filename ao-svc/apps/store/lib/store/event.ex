defmodule Store.Event do
  use Store.Model

  schema "events" do
    has_many :draws, Draw, on_delete: :delete_all

    field :name, :string
    field :year, :integer

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :year])
    |> validate_required([:name, :year])
  end

  def by(name: name, year: year) do
    Event
    |> where([e], e.name == ^name and e.year == ^year)
    |> Repo.one
    |> case do
      nil -> {:error, "No #{__MODULE__} found with name #{name}"}
      rec -> {:ok, rec}
    end
  end

  def by(id: id) do
    Event
    |> where([e], e.id == ^id)
    |> Repo.one
    |> case do
      nil -> {:error, "No #{__MODULE__} found with id #{id}"}
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