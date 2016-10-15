defmodule Founders.Repo.Migrations.CreateUsersTable do
  use Ecto.Migration

  def up do
    create table(:users) do
      add :email, :string
      add :crypted_password, :string
      add :role, :integer
      timestamps
    end
    create unique_index(:users, [:email])

    execute("create type role as enum ('admin', 'founder')")

  end

  def down do
    drop table(:users)
  end
end
