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
    get "/db", PageController, :list
    get "/scammer/:full_name", PageController, :show
    get "/id/:id_no", PageController, :identity
    get "/bank/:bank_name", PageController, :bank
    get "/account/:acc_no", PageController, :account
    get "/email/:email", PageController, :account
    get "/badge/:query", PageController, :badge
    get "/api", PageController, :api
  end

  scope "/api/v1", ScamdbWeb do
    pipe_through :api

    get "/check", ScamController, :check
    get "/badge", ScamController, :badge
    post "/scam", ScamController, :create
  end
end
