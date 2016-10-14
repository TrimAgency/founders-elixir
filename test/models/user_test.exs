defmodule Founders.UserTest do
  use Founders.ModelCase

  alias Founders.User

  @valid_attributes %{email: "valid@example.com", password: "password"}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attributes) 
    assert changeset.valid?
  end

  test "changeset without email address" do
    invalid_attrs = Map.delete(@valid_attributes, :email)

    changeset = User.changeset(%User{}, invalid_attrs)

    refute changeset.valid?
  end

  test "changeset without password" do
    invalid_attrs = Map.delete(@valid_attributes, :password)

    changeset = User.changeset(%User{}, invalid_attrs)

    refute changeset.valid?
  end
end
