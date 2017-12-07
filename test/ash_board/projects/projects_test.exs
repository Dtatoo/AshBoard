defmodule AshBoard.ProjectsTest do
  use AshBoard.DataCase

  alias AshBoard.Projects

  describe "projects" do
    alias AshBoard.Projects.Project

    @valid_attrs %{details: "some details", name: "some name"}
    @update_attrs %{details: "some updated details", name: "some updated name"}
    @invalid_attrs %{details: nil, name: nil}

    def project_fixture(attrs \\ %{}) do
      {:ok, project} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Projects.create_project()

      project
    end

    test "list_projects/0 returns all projects" do
      project = project_fixture()
      assert Projects.list_projects() == [project]
    end

    test "get_project!/1 returns the project with given id" do
      project = project_fixture()
      assert Projects.get_project!(project.id) == project
    end

    test "create_project/1 with valid data creates a project" do
      assert {:ok, %Project{} = project} = Projects.create_project(@valid_attrs)
      assert project.details == "some details"
      assert project.name == "some name"
    end

    test "create_project/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Projects.create_project(@invalid_attrs)
    end

    test "update_project/2 with valid data updates the project" do
      project = project_fixture()
      assert {:ok, project} = Projects.update_project(project, @update_attrs)
      assert %Project{} = project
      assert project.details == "some updated details"
      assert project.name == "some updated name"
    end

    test "update_project/2 with invalid data returns error changeset" do
      project = project_fixture()
      assert {:error, %Ecto.Changeset{}} = Projects.update_project(project, @invalid_attrs)
      assert project == Projects.get_project!(project.id)
    end

    test "delete_project/1 deletes the project" do
      project = project_fixture()
      assert {:ok, %Project{}} = Projects.delete_project(project)
      assert_raise Ecto.NoResultsError, fn -> Projects.get_project!(project.id) end
    end

    test "change_project/1 returns a project changeset" do
      project = project_fixture()
      assert %Ecto.Changeset{} = Projects.change_project(project)
    end
  end

  describe "groups" do
    alias AshBoard.Projects.Group

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def group_fixture(attrs \\ %{}) do
      {:ok, group} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Projects.create_group()

      group
    end

    test "list_groups/0 returns all groups" do
      group = group_fixture()
      assert Projects.list_groups() == [group]
    end

    test "get_group!/1 returns the group with given id" do
      group = group_fixture()
      assert Projects.get_group!(group.id) == group
    end

    test "create_group/1 with valid data creates a group" do
      assert {:ok, %Group{} = group} = Projects.create_group(@valid_attrs)
      assert group.name == "some name"
    end

    test "create_group/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Projects.create_group(@invalid_attrs)
    end

    test "update_group/2 with valid data updates the group" do
      group = group_fixture()
      assert {:ok, group} = Projects.update_group(group, @update_attrs)
      assert %Group{} = group
      assert group.name == "some updated name"
    end

    test "update_group/2 with invalid data returns error changeset" do
      group = group_fixture()
      assert {:error, %Ecto.Changeset{}} = Projects.update_group(group, @invalid_attrs)
      assert group == Projects.get_group!(group.id)
    end

    test "delete_group/1 deletes the group" do
      group = group_fixture()
      assert {:ok, %Group{}} = Projects.delete_group(group)
      assert_raise Ecto.NoResultsError, fn -> Projects.get_group!(group.id) end
    end

    test "change_group/1 returns a group changeset" do
      group = group_fixture()
      assert %Ecto.Changeset{} = Projects.change_group(group)
    end
  end

  describe "projects_groups" do
    alias AshBoard.Projects.ProjectGroup

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def project_group_fixture(attrs \\ %{}) do
      {:ok, project_group} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Projects.create_project_group()

      project_group
    end

    test "list_projects_groups/0 returns all projects_groups" do
      project_group = project_group_fixture()
      assert Projects.list_projects_groups() == [project_group]
    end

    test "get_project_group!/1 returns the project_group with given id" do
      project_group = project_group_fixture()
      assert Projects.get_project_group!(project_group.id) == project_group
    end

    test "create_project_group/1 with valid data creates a project_group" do
      assert {:ok, %ProjectGroup{} = project_group} = Projects.create_project_group(@valid_attrs)
    end

    test "create_project_group/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Projects.create_project_group(@invalid_attrs)
    end

    test "update_project_group/2 with valid data updates the project_group" do
      project_group = project_group_fixture()
      assert {:ok, project_group} = Projects.update_project_group(project_group, @update_attrs)
      assert %ProjectGroup{} = project_group
    end

    test "update_project_group/2 with invalid data returns error changeset" do
      project_group = project_group_fixture()
      assert {:error, %Ecto.Changeset{}} = Projects.update_project_group(project_group, @invalid_attrs)
      assert project_group == Projects.get_project_group!(project_group.id)
    end

    test "delete_project_group/1 deletes the project_group" do
      project_group = project_group_fixture()
      assert {:ok, %ProjectGroup{}} = Projects.delete_project_group(project_group)
      assert_raise Ecto.NoResultsError, fn -> Projects.get_project_group!(project_group.id) end
    end

    test "change_project_group/1 returns a project_group changeset" do
      project_group = project_group_fixture()
      assert %Ecto.Changeset{} = Projects.change_project_group(project_group)
    end
  end

  describe "projects" do
    alias AshBoard.Projects.Project

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def project_fixture(attrs \\ %{}) do
      {:ok, project} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Projects.create_project()

      project
    end

    test "list_projects/0 returns all projects" do
      project = project_fixture()
      assert Projects.list_projects() == [project]
    end

    test "get_project!/1 returns the project with given id" do
      project = project_fixture()
      assert Projects.get_project!(project.id) == project
    end

    test "create_project/1 with valid data creates a project" do
      assert {:ok, %Project{} = project} = Projects.create_project(@valid_attrs)
      assert project.name == "some name"
    end

    test "create_project/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Projects.create_project(@invalid_attrs)
    end

    test "update_project/2 with valid data updates the project" do
      project = project_fixture()
      assert {:ok, project} = Projects.update_project(project, @update_attrs)
      assert %Project{} = project
      assert project.name == "some updated name"
    end

    test "update_project/2 with invalid data returns error changeset" do
      project = project_fixture()
      assert {:error, %Ecto.Changeset{}} = Projects.update_project(project, @invalid_attrs)
      assert project == Projects.get_project!(project.id)
    end

    test "delete_project/1 deletes the project" do
      project = project_fixture()
      assert {:ok, %Project{}} = Projects.delete_project(project)
      assert_raise Ecto.NoResultsError, fn -> Projects.get_project!(project.id) end
    end

    test "change_project/1 returns a project changeset" do
      project = project_fixture()
      assert %Ecto.Changeset{} = Projects.change_project(project)
    end
  end

  describe "users_group" do
    alias AshBoard.Projects.UserGroup

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def user_group_fixture(attrs \\ %{}) do
      {:ok, user_group} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Projects.create_user_group()

      user_group
    end

    test "list_users_group/0 returns all users_group" do
      user_group = user_group_fixture()
      assert Projects.list_users_group() == [user_group]
    end

    test "get_user_group!/1 returns the user_group with given id" do
      user_group = user_group_fixture()
      assert Projects.get_user_group!(user_group.id) == user_group
    end

    test "create_user_group/1 with valid data creates a user_group" do
      assert {:ok, %UserGroup{} = user_group} = Projects.create_user_group(@valid_attrs)
    end

    test "create_user_group/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Projects.create_user_group(@invalid_attrs)
    end

    test "update_user_group/2 with valid data updates the user_group" do
      user_group = user_group_fixture()
      assert {:ok, user_group} = Projects.update_user_group(user_group, @update_attrs)
      assert %UserGroup{} = user_group
    end

    test "update_user_group/2 with invalid data returns error changeset" do
      user_group = user_group_fixture()
      assert {:error, %Ecto.Changeset{}} = Projects.update_user_group(user_group, @invalid_attrs)
      assert user_group == Projects.get_user_group!(user_group.id)
    end

    test "delete_user_group/1 deletes the user_group" do
      user_group = user_group_fixture()
      assert {:ok, %UserGroup{}} = Projects.delete_user_group(user_group)
      assert_raise Ecto.NoResultsError, fn -> Projects.get_user_group!(user_group.id) end
    end

    test "change_user_group/1 returns a user_group changeset" do
      user_group = user_group_fixture()
      assert %Ecto.Changeset{} = Projects.change_user_group(user_group)
    end
  end

  describe "projects" do
    alias AshBoard.Projects.Project

    @valid_attrs %{complete: true, name: "some name", progress: 42}
    @update_attrs %{complete: false, name: "some updated name", progress: 43}
    @invalid_attrs %{complete: nil, name: nil, progress: nil}

    def project_fixture(attrs \\ %{}) do
      {:ok, project} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Projects.create_project()

      project
    end

    test "list_projects/0 returns all projects" do
      project = project_fixture()
      assert Projects.list_projects() == [project]
    end

    test "get_project!/1 returns the project with given id" do
      project = project_fixture()
      assert Projects.get_project!(project.id) == project
    end

    test "create_project/1 with valid data creates a project" do
      assert {:ok, %Project{} = project} = Projects.create_project(@valid_attrs)
      assert project.complete == true
      assert project.name == "some name"
      assert project.progress == 42
    end

    test "create_project/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Projects.create_project(@invalid_attrs)
    end

    test "update_project/2 with valid data updates the project" do
      project = project_fixture()
      assert {:ok, project} = Projects.update_project(project, @update_attrs)
      assert %Project{} = project
      assert project.complete == false
      assert project.name == "some updated name"
      assert project.progress == 43
    end

    test "update_project/2 with invalid data returns error changeset" do
      project = project_fixture()
      assert {:error, %Ecto.Changeset{}} = Projects.update_project(project, @invalid_attrs)
      assert project == Projects.get_project!(project.id)
    end

    test "delete_project/1 deletes the project" do
      project = project_fixture()
      assert {:ok, %Project{}} = Projects.delete_project(project)
      assert_raise Ecto.NoResultsError, fn -> Projects.get_project!(project.id) end
    end

    test "change_project/1 returns a project changeset" do
      project = project_fixture()
      assert %Ecto.Changeset{} = Projects.change_project(project)
    end
  end
end
