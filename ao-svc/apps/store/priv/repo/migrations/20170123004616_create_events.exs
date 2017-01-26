defmodule Store.Repo.Migrations.CreateEvents do
  use Ecto.Migration

  def change do
    create table(:events, primary_key: true) do
      add :name, :string , null: false
      add :year, :integer, null: false

      timestamps()
    end
    create unique_index(:events, [:name])
  end
end
