defmodule ItemsApi.Router do
  use ItemsApi.Web, :router

  pipeline :api do
    plug CORSPlug, origin: [System.get_env("CLIENT_URL_ORIGIN")]
    plug :accepts, ["json"]
  end

  scope "/api", ItemsApi do
    pipe_through :api

    resources "/items", ItemController
    options "/items", ItemController, :nothing
  end

  # Other scopes may use custom stacks.
  # scope "/api", ItemsApi do
  #   pipe_through :api
  # end
end
