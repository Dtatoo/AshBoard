defmodule AshBoard.Projects do
  @moduledoc """
  The Projects context.
  """

  import Ecto.Query, warn: false
  alias AshBoard.Repo

  alias AshBoard.Projects.Project
  alias AshBoard.Accounts.User

  def list_projects do
    Repo.all(Project)
  end

  def get_project!(id), do: Repo.get!(Project, id)
  def get_project_by_name(name), do: Repo.get_by(Project, name: name)

  def get_projects_by_user(user_id) do
    query = from p in Project,
      where: p.user_id == ^user_id

    Repo.all(query)
    |> Repo.preload(:user)
  end

  def create_project(attrs \\ %{}) do
    %Project{progress: 0}
    |> Project.changeset(attrs)
    |> Repo.insert()
  end

  def update_project(%Project{} = project, attrs) do
    project
    |> Project.changeset(attrs)
    |> Repo.update()
  end

end
