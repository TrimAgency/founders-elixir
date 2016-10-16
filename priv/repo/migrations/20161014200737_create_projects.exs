defmodule Founders.Repo.Migrations.CreateProjects do
  use Ecto.Migration

  def change do
    create table(:projects) do
      add :name, :string
      add :project_url, :string
      add :email, :string

      timestamps
    end
  end
end
