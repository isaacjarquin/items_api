defmodule ItemsApi.ContactUsView do
  use ItemsApi.Web, :view

  def render("index.json", %{contact_us: contact_us}) do
    %{data: render_many(contact_us, ItemsApi.ContactUsView, "contact_us.json")}
  end

  def render("show.json", %{contact_us: contact_us}) do
    %{data: render_one(contact_us, ItemsApi.ContactUsView, "contact_us.json")}
  end

  def render("contact_us.json", %{contact_us: contact_us}) do
    %{id: contact_us.id,
      name: contact_us.name,
      email: contact_us.email,
      details: contact_us.details,
      email_sent: contact_us.email_sent}
  end
end
