defmodule ItemsApi.Router do
  use ItemsApi.Web, :router

  pipeline :api do
    plug CORSPlug, origin: [System.get_env("CLIENT_URL_ORIGIN") || "http://localhost:5070"]
    plug :accepts, ["json"]
  end

  scope "/api", ItemsApi do
    pipe_through :api

    resources "/items", ItemController
  end

  # Other scopes may use custom stacks.
  # scope "/api", ItemsApi do
  #   pipe_through :api
  # end
end
