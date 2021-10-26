defmodule RushWeb.StatsControllerTest do
  use RushWeb.ConnCase

  import Rush.RushingStatsFixtures

  describe "index" do
    test "lists all rushing_stats", %{conn: conn} do
      conn = get(conn, Routes.stats_path(conn, :index))
      assert html_response(conn, 200) =~ "Rushing Stats"
    end
  end
end
