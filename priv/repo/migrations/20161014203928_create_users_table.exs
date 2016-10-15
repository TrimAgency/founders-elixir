defmodule Founders.Repo.Migrations.CreateUsersTable do
  use Ecto.Migration

  def up do
    execute("create type role as enum ('founder', 'admin')")

    create table(:users) do
      add :email, :string
      add :crypted_password, :string
      add :role, :role, null: false, default: "founder"
      timestamps
    end
    create unique_index(:users, [:email])

  end

  def down do
    drop table(:users)

    execute("DROP TYPE role")
  end
end
