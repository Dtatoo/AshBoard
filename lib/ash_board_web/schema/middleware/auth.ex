defmodule AshBoardWeb.Schema.Middleware.Auth do
  @moduledoc """
  Authorization middleware
  """

  @behaviour Absinthe.Middleware

  alias Absinthe.Resolution

  def call(res = %{context: %{current_user: current_user}} , _) do
    res
  end
  def call(res, _) do
    Resolution.put_result(res, {:error, "Unauthorized"})
  end
end