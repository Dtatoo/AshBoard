defmodule AshBoard.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias AshBoard.Accounts.User
  alias Comeonin.Pbkdf2


  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "users" do
    field :email, :string
    field :name, :string
    field :password, :string
    field :role, :string

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:name, :email, :password, :role])
    |> validate_required([:name, :email, :password, :role])
    |> unique_constraint(:email)
    |> hash_password()
  end

  defp hash_password(changeset = %Ecto.Changeset{valid?: true, changes: %{password: password}}), do:
    changeset |> put_change(:password, Pbkdf2.hashpwsalt(password))
  defp hash_password(changeset), do: changeset

end
