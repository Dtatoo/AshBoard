use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :ash_board, AshBoardWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :ash_board, AshBoard.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "ash_board_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# Configure password encryption
config :pbkdf2_elixir, :rounds, 1
