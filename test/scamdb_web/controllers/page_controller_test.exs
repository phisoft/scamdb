defmodule ScamdbWeb.PageControllerTest do
  use ScamdbWeb.ConnCase
  
  require Logger

  test "GET /", %{conn: conn} do
    %{ status: status } = get conn, "/"
    assert 200 == status 
  end

end
