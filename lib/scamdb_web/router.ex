defmodule ScamdbWeb.Router do
  use ScamdbWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ScamdbWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/db", ScamController, :index
    get "/info", ScamController, :info
    get "/id", ScamController, :passport
    get "/bank", ScamController, :bank
    get "/bank-account", ScamController, :account
    get "/email", ScamController, :account
    resources "/scammers", ScamController
  end

  # scope "/api", ScamdbWeb do
  #   pipe_through :api
  # end
end
