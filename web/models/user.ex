defmodule Founders.User do

  use Founders.Web, :model

  schema "users" do
    field :email, :string
    field :hashed_password, :string
    field :password, :string, virtual: true
    field :role, :string
    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :role])
    |> unique_constraint(:email)
    |> validate_format(:email, ~r/^.+\@.+$/)
    |> validate_length(:password, min: 6)
    |> validate_inclusion(:role, ~w(admin founder))
  end

  def registration_changeset(struct, params \\ %{}) do
    struct
    |> changeset(params)
    |> cast(params, [:password], [])
    |> validate_required(:password)
    |> validate_length(:password, min: 6)
    |> hash_password
  end

  defp hash_password(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :hashed_password, Comeonin.Bcrypt.hashpwsalt(pass))
      _ ->
        changeset
    end
  end
end
