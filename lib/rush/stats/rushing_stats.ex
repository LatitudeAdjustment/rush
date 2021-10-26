defmodule Rush.Stats.RushingStats do
  use Ecto.Schema
  import Ecto.Changeset

  schema "rushing_stats" do
    field :player, :string
    field :position, :string
    field :team, :string

    field :data, :map

    timestamps()
  end

  @doc false
  def changeset(stats, attrs) do
    stats
    |> cast(attrs, [:player, :team, :position, :data])
    |> validate_required([:player])
  end
end
