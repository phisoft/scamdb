defmodule ScamdbWeb.PageController do
  use ScamdbWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
