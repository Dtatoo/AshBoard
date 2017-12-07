defmodule AshBoardWeb.Schema.Middleware.ChangesetErrors do
  @moduledoc """
  Converts changeset error
  """

  @behaviour Absinthe.Middleware

  alias AshBoardWeb.ErrorHelpers

  def call(res, _) do
    with %{errors: [%Ecto.Changeset{} = changeset]} <- res do
      %{res |
        value: %{errors: transform_errors(changeset)},
        errors: []
      }
    end
  end

  defp transform_errors(changeset = %Ecto.Changeset{}) do
    changeset
    |> Ecto.Changeset.traverse_errors(&ErrorHelpers.translate_error/1)
    |> Enum.map(fn {key, message} ->
      %{key: key, message: message}
    end)
  end

end