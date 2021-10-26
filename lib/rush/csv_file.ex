defmodule Rush.CsvFile do
  @column_names_not_in_map ["Player", "Team", "Pos"]
  @column_names_in_map ["Att", "Att/G", "Yds", "Avg", "Yds/G", "TD", "Lng", "1st",
    "1st%", "20+", "40+", "FUM"]
  @column_names @column_names_not_in_map ++ @column_names_in_map

  def maps_to_lists(maps) do
    Enum.map(maps, fn m -> map_to_list(m) end)
  end

  defp map_to_list(map) do
    [map.player, map.team, map.position] ++ columns_in_map(map)
  end

  defp columns_in_map(map) do
    Enum.map(@column_names_in_map, fn c -> map.data[c] end)
  end

  def to_file(data, filename) do
    col_sep = ","
    row_sep = "\n"

    data = [@column_names | data]

    csv =
      for row <- data, into: "" do
        Enum.join(row, col_sep) <> row_sep
      end

    File.write(filename, csv)
  end
end
