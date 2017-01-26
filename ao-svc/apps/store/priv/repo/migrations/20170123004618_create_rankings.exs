defmodule Store.Repo.Migrations.CreateRankings do
  use Ecto.Migration

  def change do
    create table(:rankings, primary_key: true) do
      add :rank, :integer , null: false

      timestamps()
    end
    create unique_index(:rankings, [:rank])
  end
end
