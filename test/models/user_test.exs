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

  test "changeset with a bad email address" do
    changeset = User.changeset(
      %User{}, Map.put(@valid_attributes, :email, "bad_email")
    )

    refute changeset.valid?
  end

  test "changeset with an invalid role value" do
    changeset = User.changeset(
      %User{}, Map.put(@valid_attributes, :role, "fake_role")
    )

    refute changeset.valid?
  end

  test "registration_changeset with a valid password" do
    changeset = User.registration_changeset(%User{}, @valid_attributes) 
    assert changeset.valid?
  end

  test "registration_changeset hashes a password" do
    changeset = User.registration_changeset(%User{}, @valid_attributes) 
    assert changeset.changes.hashed_password
  end

  test "registration_changeset without password" do
    invalid_attrs = Map.delete(@valid_attributes, :password)

    changeset = User.registration_changeset(%User{}, invalid_attrs)

    refute changeset.valid?
  end

  test "registration changeset with a password under 6 characters" do
    changeset = User.registration_changeset(
      %User{}, Map.put(@valid_attributes, :password, "badpw")
    )

    refute changeset.valid?
  end
end
