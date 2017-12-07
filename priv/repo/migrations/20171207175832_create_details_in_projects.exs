defmodule AshBoard.Repo.Migrations.CreateDetailsInProjects do
  use Ecto.Migration

  def change do
    alter table(:projects) do
      add :details, :string
    end
  end
end
