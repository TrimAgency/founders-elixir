defmodule Founders.ProjectController do
  use Founders.Web, :controller

   def create(conn, %{ "project" => project_params }) do
    changeset = Project.changeset(%Project{}, project_params)

       case Repo.insert(changeset) do
          {:ok, post} ->
            conn
            |> put_status(:created)
            |> put_resp_header("location", projec_path(conn, :show, project))
            |> render("show.json", project: project)
          {:error, changeset} ->
            conn
            |> put_status(:unprocessable_entity)
            |> render(RestApi.ChangesetView, "error.json", changeset: changeset)
       end      
  end
end
