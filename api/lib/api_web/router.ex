defmodule ApiWeb.Router do
  use ApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ApiWeb do
    pipe_through :api
  end

  pipeline :browser do
    plug(:accepts, ["html"])
  end

  scope "/", ApiWeb do
    pipe_through :browser
    get "/", DefaultController, :index
  end
end
