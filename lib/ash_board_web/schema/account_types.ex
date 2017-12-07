defmodule AshBoardWeb.Schema.AccountTypes do
  @moduledoc """
  AccountTypes schema definitions
  """
  use Absinthe.Schema.Notation

  alias AshBoardWeb.Resolvers.Accounts


  object :session do
    field :token, :string
    field :user, :user
    field :errors, list_of(:error)
  end

  object :user do
    field :email, :string
    field :name, :string
  end

  object :account_mutations do

    @desc "User login"
    field :login, :session do
      arg :email, non_null(:string)
      arg :password, non_null(:string)
      resolve &Accounts.login/2
    end

    @desc "User registration"
    field :register, :session do
      arg :email, non_null(:string)
      arg :password, non_null(:string)
      arg :name, non_null(:string)
      resolve &Accounts.register/2
    end

  end


end