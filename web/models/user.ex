defmodule Founders.User do

  use Founders.Web, :model

  schema "users" do
    field :email, :string
    field :crypted_password, :string
    field :password, :string, virtual: true
    timestamps()
  end

  @required_fields [:email, :password]

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields)
    |> validate_required(@required_fields)
    |> unique_constraint(:email)
    |> validate_format(:email, ~r/^.+\@.+$/)
    |> validate_length(:password, min: 6)
  end
end
