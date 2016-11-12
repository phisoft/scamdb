defmodule Scamdb.ScammerView do
  use Scamdb.Web, :view

  def render("index.json", %{scammers: scammers}) do
    %{data: render_many(scammers, Scamdb.ScammerView, "scammer.json")}
  end

  def render("show.json", %{scammer: scammer}) do
    %{data: render_one(scammer, Scamdb.ScammerView, "scammer.json")}
  end

  def render("scammer.json", %{scammer: scammer}) do
    %{id: scammer.id,
      full_name: scammer.full_name,
      passport: scammer.passport,
      email: scammer.email,
      phone: scammer.phone,
      bank_name: scammer.bank_name,
      bank_account: scammer.bank_account,
      ip: scammer.ip,
      website: scammer.website,
      country: scammer.country}
  end
end
