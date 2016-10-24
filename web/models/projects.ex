defmodule Founders.Project do
  use Founders.Web, :model
  
  @derive {Poison.Encoder, except: [:__meta__]}

  schema "projects" do
    field :name, :string
    field :project_url, :string
    field :email, :string
    
    timestamps
  end

  @required_fields ~w(name project_url email)
  @optional_fields ~w()

  def changeset(model, params \\ nil) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
