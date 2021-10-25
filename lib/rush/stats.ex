defmodule Rush.Stats do
  @moduledoc """
  The RushingStats context.
  """

  import Ecto.Query, warn: false
  alias Rush.Repo

  alias Rush.Stats.RushingStats

  @doc """
  Returns the list of rushing_stats.

  ## Examples

      iex> list_rushing_stats()
      [%Stats{}, ...]

  """
  def list_rushing_stats do
    Repo.all(RushingStats)
  end

  @doc """
  Creates a stats.

  ## Examples

      iex> create_stats(%{field: value})
      {:ok, %Stats{}}

      iex> create_stats(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_stats(attrs \\ %{}) do
    %RushingStats{}
    |> RushingStats.changeset(attrs)
    |> Repo.insert()
  end
end
