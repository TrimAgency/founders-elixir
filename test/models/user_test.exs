defmodule Founders.UserTest do
  use Founders.ModelCase

  alias Founders.User

  @valid_attributes %{email: "valid@example.com"}
  @invalid_attributes %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attributes) 
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attributes)
    refute changeset.valid?
  end
end
