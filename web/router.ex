defmodule Founders.Router do
  use Founders.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Founders do
    pipe_through :api
    resources "/users", UserController, only: [:create]
  end
  # Other scopes may use custom stacks.
  scope "/api", Founders do
    pipe_through :api

    resources "/project", ProjectController, only: [:show, :create]
  end
end
