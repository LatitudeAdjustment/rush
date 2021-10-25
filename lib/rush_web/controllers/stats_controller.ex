defmodule RushWeb.StatsController do
  use RushWeb, :controller

  # alias Rush.RushingStats
  # alias Rush.RushingStats.Stats

  alias Rush.Stats

  def index(conn, _params) do
    rushing_stats = Stats.list_rushing_stats()
    render(conn, "index.html", rushing_stats: rushing_stats)
  end
end
