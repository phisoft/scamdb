defmodule Scamdb.ScammerTest do
  use Scamdb.ModelCase

  alias Scamdb.Scammer

  @valid_attrs %{bank_account: "some content", bank_name: "some content", country: "some content", email: "some content", full_name: "some content", ip: "some content", passport: "some content", phone: "some content", website: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Scammer.changeset(%Scammer{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Scammer.changeset(%Scammer{}, @invalid_attrs)
    refute changeset.valid?
  end
end
