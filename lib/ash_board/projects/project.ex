defmodule AshBoard.Projects.Project do
  use Ecto.Schema
  import Ecto.Changeset
  alias AshBoard.Projects.Project
  alias AshBoard.Accounts.User



  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "projects" do
    field :complete, :boolean, default: false
    field :name, :string
    field :progress, :integer
    belongs_to :user, User, type: :binary_id

    timestamps()
  end

  @doc false
  def changeset(%Project{} = project, attrs) do
    project
    |> cast(attrs, [:name, :progress, :complete, :user_id])
    |> validate_required([:name, :progress, :complete])
    |> foreign_key_constraint(:user_id, message: "User does not exist")
    |> unique_constraint(:name)
    |> check_progress()
  end

  defp check_progress(changeset) do
    get_field(changeset, :progress)
    |> progress_modifier(changeset)
  end

  defp progress_modifier(progress, changeset) do
    if progress > 10 do change(changeset, %{progress: 10, complete: true})
    else changeset
    end
  end
  defp progress_modifier(nil, changeset), do: changeset

end
