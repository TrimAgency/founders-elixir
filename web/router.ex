defmodule Founders.Router do
  use Founders.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Founders do
    pipe_through :api
    resources "/users", UserController, only: [:create]
  end
end
