defmodule Rush.RushingStatsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Rush.RushingStats` context.
  """

  @doc """
  Generate a stats.
  """
  def stats_fixture(attrs \\ %{}) do
    {:ok, stats} =
      attrs
      |> Enum.into(%{player: "Joe Player", team: "JAX", position: "QB"})
      |> Rush.Stats.create_stats()

    stats
  end
end
