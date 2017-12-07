defmodule AshBoardWeb.Schema do
  @moduledoc """
  Schema for Ashboard
  """
  use Absinthe.Schema
  alias AshBoardWeb.Schema.Middleware

  import_types __MODULE__.AccountTypes
  import_types __MODULE__.ProjectTypes

  # Top level object
  object :error do
    field :key, :string
    field :message, :string
  end

  query do
    import_fields :project_queries
  end

  mutation do
    import_fields :account_mutations
    import_fields :project_mutations
  end

  def middleware(middleware, _field, %{identifier: :mutation}) do
    middleware ++ [Middleware.ChangesetErrors]
  end
  def middleware(middleware, _field, _object) do
    middleware
  end

end