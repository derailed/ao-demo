defmodule Store.Repo.Migrations.CreateMatches do
  use Ecto.Migration

  def change do
    create table(:matches, primary_key: true) do
      add :p1_id, references(:players)
      add :p2_id, references(:players)
      add :draw_id, references(:draws)

      add :score, {:array, :integer}
      add :court, :string , null: false

      timestamps()
    end
    create index(:matches, [:court])
  end
end
