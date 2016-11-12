defmodule Scamdb.PageController do
  use Scamdb.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
