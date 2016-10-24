defmodule Founders.Router do
  use Founders.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Founders do
    pipe_through :api
    resources "/users", UserController, only: [:create]
  end
<<<<<<< HEAD
=======

  # Other scopes may use custom stacks.
   scope "/api", Founders do
     pipe_through :api

     resources "/project", ProjectController, only: [:show, :create]
   end
>>>>>>> 8e9f86c53e89497a5be23720ddfc934079042b4d
end
