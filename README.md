# Rush

Based on the following:

https://github.com/tsicareers/nfl-rushing

## Load Sample Data

Initially loaded decoded sample JSON from file into GenServer, now loads JSON
file into database.

Loads rushing_data.json from base folder.

```bash
iex -S mix phx.server
```

```elixir
iex> stats = Rush.RushingData.get_data()
iex> Rush.RushingData.create_rushing_stats(stats) 
```

## Sort (Yds, TD, Lng)

Sort (via column header) only sorts high to low.

## Front End

There is no front end Javascript or Framework, it uses strictly Phoenix templates.

## Filter by Player Name

Filter by player name cannot be combined with sorting parameters.
Also this filter is not preserved when creating the CSV file.

## CSV File

The CSV filename is hardcoded to base folder, rushing_stats.csv.
