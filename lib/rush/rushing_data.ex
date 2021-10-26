defmodule Rush.RushingData do
  alias Rush.Stats

  def import_file(filename \\ "rushing_data.json") do
    read_json_data(filename)
    |> convert()
    |> create_rushing_stats()
  end

  def convert(stats) do
    case Jason.decode(stats) do
      {:ok, stats} -> Enum.map(stats, &sanitize(&1))
      _ -> []
    end
  end

  def create_rushing_stats(stats) when is_list(stats) do
    Enum.each(stats, fn s -> create_rushing_stats(s) end)
  end

  def create_rushing_stats(rushing_stats) do
    %{
      player: rushing_stats["Player"],
      team: rushing_stats["Team"],
      position: rushing_stats["Pos"],
      data: %{
        Att: rushing_stats["Att"],
        "Att/G": rushing_stats["Att/G"],
        Yds: rushing_stats["Yds"],
        Avg: rushing_stats["Avg"],
        "Yds/G": rushing_stats["Yds/G"],
        TD: rushing_stats["TD"],
        Lng: rushing_stats["Lng"],
        "1st": rushing_stats["1st"],
        "1st%": rushing_stats["1st%"],
        "20+": rushing_stats["20+"],
        "40+": rushing_stats["40+"],
        FUM: rushing_stats["FUM"]
      }
    }
    |> Stats.create_stats()
  end

  defp sanitize(stats) do
    sanitize_yds(stats)
    |> sanitize_lng()
  end

  defp sanitize_yds(stats) do
    case is_binary(stats["Yds"]) do
      true ->
        Map.put(
          stats,
          "Yds",
          String.replace(stats["Yds"], ",", "")
          |> String.to_integer()
        )

      false ->
        stats
    end
  end

  defp sanitize_lng(stats) do
    case is_integer(stats["Lng"]) do
      true -> Map.put(stats, "Lng", Integer.to_string(stats["Lng"]))
      false -> stats
    end
  end

  defp read_json_data(filename) do
    case File.read(filename) do
      {:ok, data} -> data
      {:error, _reason} -> nil
    end
  end
end
