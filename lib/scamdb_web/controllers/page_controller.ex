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
      |> render(:index)
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

  def account(conn, %{ "acc_no" => account }) do
    result = Scam |> where([u], u.bank_account == ^account) |> Repo.all()
    conn
      |> assign(:info, Enum.at(result, 0))
      |> assign(:total, Enum.count(result))
      |> assign(:current_url, current_url(conn))
      |> render(:show)
  end
end
