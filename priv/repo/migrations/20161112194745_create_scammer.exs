defmodule Scamdb.Repo.Migrations.CreateScammer do
  use Ecto.Migration

  def change do
    create table(:scammers) do
      add :full_name, :string
      add :passport, :string
      add :email, :string
      add :phone, :string
      add :bank_name, :string
      add :bank_account, :string
      add :ip, :string
      add :website, :string
      add :country, :string

      timestamps()
    end

  end
end
