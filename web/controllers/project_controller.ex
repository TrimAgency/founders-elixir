defmodule Founders.ProjectController do
  use Founders.Web, :controller

  alias Founders.Project

  plug :scrub_params, "project" when action in [:create]

  def create(conn, %{ "project" => project_params  }) do
   changeset = Project.changeset(%Project{}, project_params)

     case Repo.insert(changeset) do
        {:ok, project} ->
          conn
          |> put_status(:created)
          |> render("show.json", project: project)
        {:error, changeset} ->
          conn
          |> put_status(:unprocessable_entity)
          |> render(Founders.ChangesetView, "error.json", changeset: changeset) 
     end      
   end
end
