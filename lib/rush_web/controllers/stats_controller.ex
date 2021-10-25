defmodule RushWeb.StatsController do
  use RushWeb, :controller

  alias Rush.Stats
  alias Rush.CsvFile

  def index(conn, %{"name" => name} = _params) do
    rushing_stats =
      Stats.list_rushing_stats()
      |> Enum.filter(fn stats -> String.contains?(stats.player, name) end)
    render(conn, "index.html", rushing_stats: rushing_stats)
  end

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

  def index(conn, %{"output" => "CSV"} = _params) do
    rushing_stats = Stats.list_rushing_stats()
    filename = "rushing_stats.csv"
    write_csv_file(rushing_stats, filename)
    conn =
      conn
      |> put_flash(:info, "Wrote CSV file: #{filename}")
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

  defp write_csv_file(rushing_stats, filename) do
    rushing_stats
      |> CsvFile.maps_to_lists()
      |> CsvFile.to_file(filename)
  end
end
