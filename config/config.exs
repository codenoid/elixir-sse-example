# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :sse_example, SseExampleWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "IiNLP8XEzXxY1dwR9bfKFUfW23tpcgDw49pkxROpwq9ThbrXk7uxic0z7rXTrHEP",
  render_errors: [view: SseExampleWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: SseExample.PubSub, adapter: Phoenix.PubSub.PG2],
  idle_timeout: :infinity

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :sse,
  keep_alive: {:system, "SSE_KEEP_ALIVE_IN_MS", 1000} # Keep alive in milliseconds

config :event_bus,
  topics: [:free_coupon]

config :mime, :types, %{    
  "text/event-stream" => ["text"]
}

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
