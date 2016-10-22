defmodule Founders.ChangesetView do
  use Founders.Web, :view

  def render("error.json", %{changeset: changeset}) do
    %{errors: render_errors(changeset)}
  end

  def render_errors(changeset) do
    Ecto.Changeset.traverse_errors(changeset, &translate_error/1)
  end
end
