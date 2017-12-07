defmodule AshBoard.Repo.Migrations.CreateProjects do
  use Ecto.Migration

  def change do
    create table(:projects, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string, null: false
      add :progress, :integer, default: 0, null: false
      add :complete, :boolean, default: false, null: false
      add :user_id, references(:users, on_delete: :nothing, type: :binary_id, null: false)

      timestamps()
    end

    create index(:projects, [:user_id])
    create unique_index(:projects, [:name])
  end
end
