defmodule AshBoard.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias AshBoard.Repo
  alias AshBoard.Accounts.{User}
  alias Comeonin.Pbkdf2

  @invalid_login_message "Invalid credential(s)"

  def get_user_by_id(id) do
    Repo.get(User, id)
  end

  def register_user(args, role \\ "NORMAL") do
    %User{role: role}
    |> User.changeset(args)
    |> Repo.insert()
  end

  def authenticate_user(%{email: email, password: password}) do
    Repo.get_by(User, email: email)
    |> check_pw(password)
  end

  defp check_pw(user = %User{}, password) do
    if Pbkdf2.checkpw(password, user.password) do
      {:ok, user}
    else
      {:error, @invalid_login_message}
    end
  end
  defp check_pw(_, _) do
    Pbkdf2.dummy_checkpw()
    {:error, @invalid_login_message}
  end


end