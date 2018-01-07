defmodule ScamdbWeb.ScamController do
  use ScamdbWeb, :controller
  use ScamdbWeb, :model
  require Logger

  alias Scamdb.Scam
  alias Scamdb.Repo


  def check(conn, %{"query" => query}) do
    result = Scam
      |> where([s], ilike(s.full_name, ^"#{query}%"))
      |> or_where([s], s.phone == ^query)
      |> or_where([s], s.email == ^query)
      |> or_where([s], s.bank_account == ^query)
      |> or_where([s], s.passport == ^query)
      |> Repo.all()

    json conn, result || []
  end


  def create(conn, params) do
    params = Map.put(params, "ip", "127.0.0.1")
    changeset = Scam.changeset(%Scam{}, params)
    case Repo.insert(changeset) do
      {:ok, _scammer} ->
        json conn, %{ result: "ok" }
      {:error, changeset} ->
        errors = Enum.map(changeset.errors, fn{k,v} -> 
          { msg, _ } = v  
          %{ field: k, error: msg }
        end)
        conn
          |> put_status(400)
          |> json(errors)
    end
  end

end
