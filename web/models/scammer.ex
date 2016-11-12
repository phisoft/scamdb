defmodule Scamdb.Scammer do
  use Scamdb.Web, :model

  schema "scammers" do
    field :full_name, :string
    field :passport, :string
    field :email, :string
    field :phone, :string
    field :bank_name, :string
    field :bank_account, :string
    field :ip, :string
    field :website, :string
    field :country, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:full_name, :passport, :email, :phone, :bank_name, :bank_account, :ip, :website, :country])
    |> validate_required([:full_name, :passport, :email, :phone, :bank_name, :bank_account, :ip, :website, :country])
  end
end
