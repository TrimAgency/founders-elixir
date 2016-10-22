defmodule Founders.UserControllerTest do
  use Founders.ConnCase

  alias Founders.User
  alias Founders.UserControllerTest, as: ConTest

  @valid_attrs %{email: "founder@example.com", 
   password: "password", role: "founder" }

  def set_headers(conn) do
    put_req_header(conn, "accept", "application/json")
  end

  test "renders created user's attributes", %{conn: conn} do
    conn = ConTest.set_headers conn
    conn = post conn, user_path(conn, :create), user: @valid_attrs
    body = json_response(conn, 201)["data"]

    assert conn.status == 201
    assert body["email"] == @valid_attrs[:email]
    assert body["role"] == @valid_attrs[:role]
  end

  test "persists a user in the database", %{conn: conn} do
    conn = ConTest.set_headers conn
    conn = post conn, user_path(conn, :create), user: @valid_attrs

    user = Repo.get_by(User, email: @valid_attrs[:email])
    assert user.email == @valid_attrs[:email]
    assert user.role == @valid_attrs[:role]
  end
end
