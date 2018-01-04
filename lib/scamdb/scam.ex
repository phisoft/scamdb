defmodule Scamdb.Scam do
  use ScamdbWeb, :model
  
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

  def changeset(scam, params \\ %{}) do
    scam
    |> cast(params, [:full_name, :passport, :email, :phone, :bank_name, :bank_account, :ip, :website, :country])
    |> validate_required([:full_name, :bank_name, :bank_account, :ip, :country]) 
    |> validate_format(:email, ~r/[a-z\d\.\+]+@[\w]+[\.a-z]+/x)
    |> validate_format(:phone, ~r/^\+\d{9,20}$/x)
    |> validate_format(:website, ~r/^[\w\.]+\.[a-z]{1,3}[\d\/\w]+$/x)
    |> validate_format(:bank_account, ~r/^\d{10,25}$/x)
  end
end
