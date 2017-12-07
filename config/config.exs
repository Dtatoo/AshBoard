# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :ash_board,
  ecto_repos: [AshBoard.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :ash_board, AshBoardWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "2evOmGoWDYuEz5loWmHfeATbkWCZmll3GPnBcc1NGotBFHFmgleLI3BFZXdpcYub",
  render_errors: [view: AshBoardWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: AshBoard.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :ash_board,
  token_salt: "XEJTjj6FtaJtADOsmzN42ocEM08x+trx5VcB8/8btzFqNovA7nJJcaLFtWPcMmBm"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
