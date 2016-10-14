defmodule Founders.PageController do
  use Founders.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
