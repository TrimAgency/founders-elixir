defmodule Founders.ProjectView do
  use Founders.Web, :view
  
  def render("show.json", %{project: project}) do
    %{data: render_one(project, Founders.ProjectView, "post.json")}
  end

  def render("post.json", %{project: project}) do
    %{ id: project.id,
       name: project.name,
       project_url: project.project_url,
       email: project.email }
  end

end
