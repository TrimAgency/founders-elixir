defmodule Founders.User do

  use Founders.Web, :model

  schema "users" do
    field :email, :string
    timestamps()
  end

  @required_fields ~w(email)

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email])
    |> validate_required([:email])
  end
end
