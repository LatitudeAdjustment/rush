defmodule Rush.RushingServer do
  use GenServer

  alias Rush.RushingServer

  defstruct stats: []

  def start_link(default) when is_list(default) do
    GenServer.start_link(__MODULE__, default, name: __MODULE__)
  end

  def get_data() do
    GenServer.call(Rush.RushingServer, {:all})
  end

  @impl true
  def init([]) do
    send(self(), :get_rushing_data)
    {:ok, []}
  end

  @impl true
  def handle_call({:all}, _from, state) do
    {:reply, state.stats, state}
  end

  @impl true
  def handle_info(:get_rushing_data, _state) do
    state = Map.put(%RushingServer{}, :stats, Rush.RushingData.get_data())
    {:noreply, state}
  end
end
