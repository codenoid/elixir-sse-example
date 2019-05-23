defmodule SseExampleWeb.Router do
  use SseExampleWeb, :router

  pipeline :browser do
    plug :accepts, ["html", "text/event-stream"]
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SseExampleWeb do

    get "/", PageController, :index
    get "/sse", PageController, :show
    get "/update", PageController, :update
    
  end

  # Other scopes may use custom stacks.
  # scope "/api", SseExampleWeb do
  #   pipe_through :api
  # end
end
