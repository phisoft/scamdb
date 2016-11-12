defmodule Scamdb.ScammerControllerTest do
  use Scamdb.ConnCase

  alias Scamdb.Scammer
  @valid_attrs %{bank_account: "some content", bank_name: "some content", country: "some content", email: "some content", full_name: "some content", ip: "some content", passport: "some content", phone: "some content", website: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, scammer_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    scammer = Repo.insert! %Scammer{}
    conn = get conn, scammer_path(conn, :show, scammer)
    assert json_response(conn, 200)["data"] == %{"id" => scammer.id,
      "full_name" => scammer.full_name,
      "passport" => scammer.passport,
      "email" => scammer.email,
      "phone" => scammer.phone,
      "bank_name" => scammer.bank_name,
      "bank_account" => scammer.bank_account,
      "ip" => scammer.ip,
      "website" => scammer.website,
      "country" => scammer.country}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, scammer_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, scammer_path(conn, :create), scammer: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Scammer, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, scammer_path(conn, :create), scammer: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    scammer = Repo.insert! %Scammer{}
    conn = put conn, scammer_path(conn, :update, scammer), scammer: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Scammer, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    scammer = Repo.insert! %Scammer{}
    conn = put conn, scammer_path(conn, :update, scammer), scammer: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    scammer = Repo.insert! %Scammer{}
    conn = delete conn, scammer_path(conn, :delete, scammer)
    assert response(conn, 204)
    refute Repo.get(Scammer, scammer.id)
  end
end
