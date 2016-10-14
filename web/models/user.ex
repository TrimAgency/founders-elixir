defmodule Founders.User do

  use Founders.Web, :model

  schema "users" do
    field :email, :string
    field :password, :string
    timestamps()
  end

  @required_fields ~w(email, password)

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :password])
    |> validate_required([:email, :password])
  end
end
