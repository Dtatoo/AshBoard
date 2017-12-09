defmodule AshBoardWeb.Router do
  use AshBoardWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug AshBoardWeb.Context
  end

  scope "/" do
    pipe_through :api

    forward "/api", Absinthe.Plug,
      schema: AshBoardWeb.Schema

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: AshBoardWeb.Schema,
      interface: :playground,
      socket: AshBoardWeb.UserSocket
  end

end
