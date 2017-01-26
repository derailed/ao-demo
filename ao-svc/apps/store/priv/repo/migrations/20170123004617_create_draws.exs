defmodule Store.Repo.Migrations.CreateDraws do
  use Ecto.Migration

  def change do
    create table(:draws, primary_key: true) do
      add :event_id, references(:events)
      add :round, :string , null: false

      timestamps()
    end
    create unique_index(:draws, [:round])
  end
end
