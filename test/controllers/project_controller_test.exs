defmodule Founders.ProjectControllerTest do
  use Founders.ConnCase

  alias Founders.Project

  @valid_attrs %{name: "test project", project_url: "www.test.com", email: "test@test.com"}
  @invalid_attrs %{ name: nil, project_url: nil, email: nil}

  setup do
    conn = build_conn() |> put_req_header("accept", "application/json")
    {:ok, conn: conn }
  end


  test "create project with valid attrs and JSON response", %{conn: conn} do
    conn = post conn, project_path(conn, :create), project: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Project, @valid_attrs)
  end

  test "does not create project with invalid attrs", %{conn: conn} do
    conn = post conn, project_path(conn, :create), project: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

end
