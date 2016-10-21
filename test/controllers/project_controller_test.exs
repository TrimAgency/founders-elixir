defmodule Founders.ProjectControllerTest do
  use Founders.ConnCase

  test "#index renders list of projects" do
    conn = build_conn()

    conn = get conn, project_path(conn, :index)

    assert json_response(conn, 200) == %{
      "projects" => [%{
        "name" => project.name,
        "project_url" => project.project_url,
        "email" => project.email
        }]
      }
  end
end
