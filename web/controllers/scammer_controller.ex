defmodule Scamdb.ScammerController do
  use Scamdb.Web, :controller

  alias Scamdb.Scammer

  def index(conn, _params) do
    scammers = Repo.all(Scammer)
    render(conn, "index.json", scammers: scammers)
  end

  def create(conn, %{"scammer" => scammer_params}) do
    changeset = Scammer.changeset(%Scammer{}, scammer_params)

    case Repo.insert(changeset) do
      {:ok, scammer} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", scammer_path(conn, :show, scammer))
        |> render("show.json", scammer: scammer)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Scamdb.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    scammer = Repo.get!(Scammer, id)
    render(conn, "show.json", scammer: scammer)
  end

  def update(conn, %{"id" => id, "scammer" => scammer_params}) do
    scammer = Repo.get!(Scammer, id)
    changeset = Scammer.changeset(scammer, scammer_params)

    case Repo.update(changeset) do
      {:ok, scammer} ->
        render(conn, "show.json", scammer: scammer)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Scamdb.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    scammer = Repo.get!(Scammer, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(scammer)

    send_resp(conn, :no_content, "")
  end
end
