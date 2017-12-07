defmodule AshBoardWeb.Resolvers.Accounts do
  @moduledoc """
  The resolver for Account schema
  """
  alias AshBoardWeb.Auth
  alias AshBoard.Accounts

  def login(args = %{email: email, password: password}, _) do
    args
    |> Accounts.authenticate_user()
    |> gen_token()
  end

  def register(args = %{email: email, password: password, name: name}, _) do
    Accounts.register_user(args)
    |> gen_token()
  end

  defp gen_token({:ok, user}) do
    {:ok, %{token: Auth.generate_token(%{id: user.id, role: user.role}), user: user}}
  end
  defp gen_token(error), do: error




end