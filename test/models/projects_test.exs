defmodule Founders.ProjectTest do
  use Founders.ModelCase

  alias Founders.Project

  @valid_attrs %{name: "jimbo", project: "jimbo's projetc", email: "jim@jim.com"}
  @invalid_attrs %{ name: false, project: 1234}

  test "changeset with valid attributes" do
    changeset = Project.changeset(%Project{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Project.changeset(%Project{}, @invalid_attrs)
    refute changeset.valid?
  end
end
