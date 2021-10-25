defmodule RushWeb.StatsController do
  use RushWeb, :controller

  alias Rush.Stats

  def index(conn, %{"sort" => "Yds"} = _params) do
    rushing_stats =
      Stats.list_rushing_stats()
      |> Enum.sort(&(&1.data["Yds"] >= &2.data["Yds"]))
    render(conn, "index.html", rushing_stats: rushing_stats)
  end

  def index(conn, %{"sort" => "Lng"} = _params) do
    rushing_stats =
      Stats.list_rushing_stats()
      |> Enum.sort(&(sort_lng(&1.data["Lng"], &2.data["Lng"])))
    render(conn, "index.html", rushing_stats: rushing_stats)
  end

  def index(conn, %{"sort" => "TD"} = _params) do
    rushing_stats =
      Stats.list_rushing_stats()
      |> Enum.sort(&(&1.data["TD"] >= &2.data["TD"]))
    render(conn, "index.html", rushing_stats: rushing_stats)
  end

  def index(conn, _params) do
    rushing_stats = Stats.list_rushing_stats()
    render(conn, "index.html", rushing_stats: rushing_stats)
  end

  defp sort_lng(p1, p2) when not is_nil(p1) and not is_nil(p2) do
    p1 = String.replace(p1, "T", "") |> String.to_integer()
    p2 = String.replace(p2, "T", "") |> String.to_integer()
    p1 >= p2
  end
end
