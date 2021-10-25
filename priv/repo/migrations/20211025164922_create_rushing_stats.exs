defmodule Rush.Repo.Migrations.CreateRushingStats do
  use Ecto.Migration

  def change do
    create table(:rushing_stats) do
      add :player, :string
      add :team, :string
      add :position, :string

      add :yds, :integer
      add :lng, :integer
      add :td, :integer

      add :data, :map

      timestamps()
    end
  end
end
