defmodule AshBoardWeb.Auth do
  @moduledoc """
  The authentication module. Responsible for generating a token for a user
  """
  alias Phoenix.Token
  @salt Application.fetch_env!(:ash_board, :token_salt)

  def generate_token(data), do: Token.sign(AshBoardWeb.Endpoint, @salt, data)

  def verify_token(token) do
    Token.verify(AshBoardWeb.Endpoint, @salt, token, max_age: 86400)
  end

end