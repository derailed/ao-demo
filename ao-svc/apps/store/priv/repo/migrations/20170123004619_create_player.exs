defmodule Store.Repo.Migrations.CreatePlayer do
  use Ecto.Migration

  def change do
    create table(:players, primary_key: true) do
      add :ranking_id, references(:rankings)

      add :name   , :string , null: false
      add :age    , :integer, null: false
      add :gender , :string , null: false
      add :country, :string , null: false

      timestamps()
    end
    create index(:players, [:gender, :country])
    create unique_index(:players, [:name])
  end
end
