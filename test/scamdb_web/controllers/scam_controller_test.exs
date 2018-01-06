defmodule ScamdbWeb.ScamControllerTest do
  use ScamdbWeb.ConnCase
  
  require Logger

  test "GET /api/v1/check", %{conn: conn} do
    %{ status: status } = get conn, scam_path(conn, :check, query: "hello")
    assert 200 == status 
  end

  test "POST /api/v1/scam", %{conn: conn} do
    args = %{
      full_name: "world",
      country: "MY",
      bank_name: "CIMB",
      bank_account: "012345678910",
      passport: "h088383",
      phone: "+60128663836",
      website: "mudah.my",
      email: "test@world.com",
      detail: ""
    }
    %{ resp_body: body, status: status } = post conn, scam_path(conn, :create, args) 
    {:ok, res } = body |> Poison.decode
    assert 200 == status 
    assert "ok" == res["result"]
  end
end
