defmodule Founders.UserTest do
  use Founders.ModelCase

  alias Founders.User

  @valid_attributes %{
    email: "valid@example.com", 
    password: "password",
    role: "founder"
  }

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

  test "changeset with a bad email address" do
    replace_email = fn current_value ->
      {current_value, "bad email" }
    end
    invalid_attrs = Map.get_and_update(@valid_attributes, :email, replace_email)

    changeset = User.changeset %User{}, elem(invalid_attrs, 1)

    refute changeset.valid?
  end

  test "changeset with a password under 6 characters" do
    replace_password = fn current_value ->
      {current_value, "badpw" }
    end
    invalid_attrs = Map.get_and_update(@valid_attributes, :email, replace_password)

    changeset = User.changeset %User{}, elem(invalid_attrs, 1)

    refute changeset.valid?
  end

  test "changeset with an invalid role value" do
    replace_role = fn current_value ->
      {current_value, "fake_role" }
    end
    invalid_attrs = Map.get_and_update(@valid_attributes, :role, replace_role)

    changeset = User.changeset %User{}, elem(invalid_attrs, 1)

    refute changeset.valid?
  end
end
