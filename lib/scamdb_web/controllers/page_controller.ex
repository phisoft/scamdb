defmodule ScamdbWeb.PageController do
  use ScamdbWeb, :controller
  use ScamdbWeb, :model

  require Logger

  alias Scamdb.Scam
  alias Scamdb.Repo

  def index(conn, _params) do
    latest_scams = Scam 
      |> limit(5)
      |> Repo.all()

    conn
      |> assign(:banks, latest_scams)
      |> render("index.html")
  end

  def show(conn, _params) do
    conn
  end 

  def info(conn, _params) do
    conn
  end

  def identity(conn, _params) do
    conn
  end

  def bank(conn, _params) do
    conn
  end

  def account(conn, _params) do
    conn
  end
end
