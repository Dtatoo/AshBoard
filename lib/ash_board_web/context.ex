defmodule AshBoardWeb.Context do
  @moduledoc """
  The module to build context from token
  """
  @behaviour Plug
  import Plug.Conn

  alias AshBoardWeb.Auth
  alias AshBoard.Accounts
  alias AshBoard.Accounts.User

  def init(opts), do: opts

  def call(conn, _) do
    put_private(conn,:absinthe, %{context: build_context(conn)})
  end

  defp build_context(conn) do
    with ["Bearer" <> token] <- get_req_header(conn, "authorization"),
         {:ok, %{id: id, role: role}} <- Auth.verify_token(token),
         %User{} = user = Accounts.get_user_by_id(id) do
      %{current_user: user}
    else
      _ -> %{}
    end
  end


end