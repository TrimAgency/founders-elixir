defmodule Founders.UserView do
  use Founders.Web, :view

  alias Founders.UserView

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user }) do
    %{id: user.id, email: user.email, role: user.role}
  end
end
