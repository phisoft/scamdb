defmodule ScamdbWeb.PageController do
  use ScamdbWeb, :controller
  use ScamdbWeb, :model

  require Logger

  alias Scamdb.Scam
  alias Scamdb.Repo

  def index(conn, _params) do
    latest_scams = Scam 
      |> where([u], not is_nil(u.bank_account))
      |> order_by([u], [ desc: u.id ])
      |> limit(6)
      |> Repo.all()

    conn
      |> assign(:banks, latest_scams)
      |> render(:index)
  end

  def list(conn, _params) do
    result = Scam |> order_by([s], [ desc: s.id ]) |> Repo.all()
    conn
      |> assign(:scammers, result)
      |> assign(:total, Enum.count(result))
      |> assign(:current_url, current_url(conn))
      |> render(:list)
  end 

  def info(conn, %{ "full_name" => full_name }) do
    result = Scam |> where([u], u.full_name == ^full_name) |> Repo.all()
    conn
      |> assign(:info, Enum.at(result, 0))
      |> assign(:total, Enum.count(result))
      |> assign(:current_url, current_url(conn))
      |> render(:show)
  end

  def identity(conn, %{ "id_no" => id_no }) do
    result = Scam |> where([u], u.passport == ^id_no) |> Repo.all()
    conn
      |> assign(:info, Enum.at(result, 0))
      |> assign(:total, Enum.count(result))
      |> assign(:current_url, current_url(conn))
      |> render(:show)
  end

  def bank(conn, %{ "bank_name" => bank_name }) do
    result = Scam |> where([u], u.bank_name == ^bank_name) |> Repo.all()
    conn
      |> assign(:info, Enum.at(result, 0))
      |> assign(:total, Enum.count(result))
      |> assign(:current_url, current_url(conn))
      |> render(:show)
  end

  def account(conn, %{ "acc_no" => account }) do
    result = Scam |> where([u], u.bank_account == ^account) |> Repo.all()
    conn
      |> assign(:info, Enum.at(result, 0))
      |> assign(:total, Enum.count(result))
      |> assign(:current_url, current_url(conn))
      |> render(:show)
  end

  def api(conn, _params) do
    conn |> render(:api)
  end 

end
