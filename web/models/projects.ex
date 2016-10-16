defmodule Founders.Project do
  use Founders.Web, :model

  schema "projects" do
    field :name, :string
    field :project_url, :string
    field :email, :string
    
    timestamps
  end

  @required_fields ~w(name project_url email)

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields)
  end
end
