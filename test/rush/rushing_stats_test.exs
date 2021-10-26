defmodule Rush.RushingStatsTest do
  use Rush.DataCase

  alias Rush.Stats
  alias Rush.RushingStats
  alias Rush.Stats.RushingStats

  describe "rushing_stats" do
    import Rush.RushingStatsFixtures

    @invalid_attrs %{}

    test "list_rushing_stats/0 returns all rushing_stats" do
      stats = stats_fixture()
      assert Stats.list_rushing_stats() == [stats]
    end

    test "create_stats/1 with valid data creates a stats" do
      valid_attrs = %{player: "Joe Player", team: "JAX", position: "QB"}

      assert {:ok, %RushingStats{} = stats} = Stats.create_stats(valid_attrs)
      assert stats.player == valid_attrs.player
      assert stats.team == valid_attrs.team
      assert stats.position == valid_attrs.position
    end

    test "create_stats/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Stats.create_stats(@invalid_attrs)
    end
  end
end
