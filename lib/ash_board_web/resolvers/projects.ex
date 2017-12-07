defmodule AshBoardWeb.Resolvers.Projects do
  @moduledoc """
  The resolver for Project schema
  """

  alias AshBoard.Projects

  def get_project(%{name: name}, _) do
    Projects.get_project_by_name(name)
  end

  def get_projects_by_user(%{user_id: user_id}, _) do
    {:ok, Projects.get_projects_by_user(user_id)}
  end

  def get_projects_by_current_user(_, context: %{current_user: user}) do
    {:ok, Projects.get_projects_by_user(user.id)}
  end

  def get_project_by_name(%{name: name}, _) do
    {:ok, Projects.get_project_by_name(name)}
  end

  def get_all_projects(_, _) do
    {:ok, Projects.list_projects()}
  end

  def create_project(attrs , value) do
# = %{name: name}
# %{context: %{current_user: user}}
    IO.inspect(value.context)
    # Map.put(attrs, :user_id, user.id)
    # |> IO.inspect()
    # |> Projects.create_project()
  end

  def update_project(attrs = %{id: id}, _) do
    Projects.get_project!(id)
    |> Projects.update_project(attrs)
  end

end