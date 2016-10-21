defmodule Founders.ProjectController do
  use Founders.Web, :controller

  alias Founders.Project
    
  def create(conn, %{ "project" => project_params  }) do
   changeset = Project.changeset(%Project{}, project_params)

     case Repo.insert(changeset) do
        {:ok, project} ->
          conn
          |> put_status(:created)
          |> render("post.json", project: project)
        {:error, changeset} ->
          conn
          |> put_status(:unprocessable_entity)
          |> render(RestApi.ChangesetView, "error.json", changeset: changeset)
     end      
   end
end
