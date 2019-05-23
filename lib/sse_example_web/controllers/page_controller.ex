defmodule SseExampleWeb.PageController do
  @topic :free_coupon
  use SseExampleWeb, :controller

  alias SSE.Chunk

  def index(conn, _params) do
    render(conn, "index.html")
  end

  # Sample action to display USD to EUR exchange rates
  def show(conn, _params) do
    rates = %{rates: Ticker.fetch()}
    chunk = %Chunk{data: Jason.encode!(rates)}

    conn |> SSE.stream({[@topic], chunk})
  end
end
