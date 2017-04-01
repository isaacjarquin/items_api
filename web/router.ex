defmodule ItemsApi.Router do
  use ItemsApi.Web, :router

  pipeline :api do
    plug CORSPlug
    plug :accepts, ["json"]
  end

  scope "/api", ItemsApi do
    pipe_through :api

    resources "/items", ItemController
    options "/items", ItemController, :options

    resources "/contact_details", ContactDetailController
    options "/contact_details", ContactDetailController, :options

    resources "/contact_us", ContactUsController
    options "/contact_us", ContactUsController, :options
  end

  # Other scopes may use custom stacks.
  # scope "/api", ItemsApi do
  #   pipe_through :api
  # end
end
