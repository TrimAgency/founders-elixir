defmodule Founders.UserControllerTest do
  use Founders.ConnCase

  alias Founders.User

  @valid_attrs %{email: "founder@example.com", 
   password: "password", role: "founder" }

  setup %{conn: conn} do
    {:ok, %{conn: put_req_header(conn, "accept", "application/json")}}
  end

  test "renders created resource", %{conn: conn} do
    conn = post conn, user_path(conn, :create), user: @valid_attrs
    body = json_response(conn, 201)

    IO.inspect body

    assert body
  end
end
