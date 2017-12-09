defmodule AshBoardWeb.Schema.ProjectTypes do
  @moduledoc """
  ProjectTypes schema definitions
  """
  use Absinthe.Schema.Notation

  alias AshBoardWeb.Resolvers.Projects

  object :project do
    field :id, :id
    field :name, :string
    field :complete, :boolean
    field :progress, :integer
  end

  object :project_with_user do
    field :id, :id
    field :name, :string
    field :complete, :boolean
    field :progress, :integer
    field :user, :user
  end

  object :project_result do
    field :project, :project
    field :errors, list_of(:error)
  end

  object :project_with_user_result do
    field :project, :project_with_user
    field :errors, list_of(:error)
  end

  # PROJECT QUERIES
  object :project_queries do
    @desc "Get all projects"
    field :all_projects, list_of(:project) do
      middleware AshBoardWeb.Schema.Middleware.Auth
      resolve &Projects.get_all_projects/2
    end

    @desc "Get a project by name"
    field :project, :project do
      arg :name, non_null(:string)
      middleware AshBoardWeb.Schema.Middleware.Auth
      resolve &Projects.get_project_by_name/2
    end

    @desc "Get all projects by current user"
    field :project_by_current_user, list_of(:project) do
      middleware AshBoardWeb.Schema.Middleware.Auth
      resolve &Projects.get_projects_by_current_user/2
    end

    @desc "Get all projects by user"
    field :list_project, list_of(:project_with_user) do
      arg :user_id, non_null(:id)
      middleware AshBoardWeb.Schema.Middleware.Auth
      resolve &Projects.get_projects_by_user/2
    end
  end

  object :project_mutations do
    @desc "Create a new project"
    field :create_project, :project_result do
      arg :name, non_null(:string)
      arg :details, :string
      middleware AshBoardWeb.Schema.Middleware.Auth
      resolve &Projects.create_project/2
    end

    @desc "Update a project"
    field :update_project, :project_result do
      arg :id, non_null(:id)
      arg :name, :string
      arg :details, :string
      arg :progress, :integer
      arg :complete, :boolean
      middleware AshBoardWeb.Schema.Middleware.Auth
      resolve &Projects.update_project/2
    end
  end

  object :project_subscriptions do
    field :update_project, :project do
      arg :id, non_null(:id)

      config fn args, _info ->
        {:ok, topic: args.id}
      end

      trigger :update_project, topic: fn
        %{project: project} -> [project.id]
        _ -> []
      end

      resolve &resolve_sub/3
    end

  end

  defp resolve_sub(%{project: project}, _topic, _res) do
    {:ok, project}
  end

end