defmodule Ticker do
  alias EventBus.Model.Event
  alias SSE.Chunk
  use GenServer

  @topic :free_coupon

  def start_link do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def fetch do
    GenServer.call(__MODULE__, {:fetch})
  end

  def init(_) do
    # Let's update the rates info every second
    update_exchange_rates_later()
    {:ok, fetch_rates()}
  end

  def handle_info(:update_exchange_rates, state) do
    new_rates = fetch_rates()

    unless state == new_rates do
      rates = %{rates: new_rates}
      chunk = %Chunk{data: Jason.encode!(rates)}
      event = %Event{id: UUID.uuid4(), data: chunk, topic: @topic}
      EventBus.notify(event)
    end

    update_exchange_rates_later()
    {:noreply, new_rates}
  end

  def handle_call({:fetch}, _from, state) do
    {:reply, state, state}
  end

  defp fetch_rates do
    [UUID.uuid4()]
  end

  defp update_exchange_rates_later do
    Process.send_after(self(), :update_exchange_rates, 1000)
  end
end
