defmodule ItemsApi.ContactDetailView do
  use ItemsApi.Web, :view

  def render("index.json", %{contact_details: contact_details}) do
    %{data: render_many(contact_details, ItemsApi.ContactDetailView, "contact_detail.json")}
  end

  def render("show.json", %{contact_detail: contact_detail}) do
    %{data: render_one(contact_detail, ItemsApi.ContactDetailView, "contact_detail.json")}
  end

  def render("contact_detail.json", %{contact_detail: contact_detail}) do
    %{id: contact_detail.id,
      name: contact_detail.name,
      email: contact_detail.email,
      phone_number: contact_detail.phone_number,
      details: contact_detail.details,
      item_id: contact_detail.item_id}
  end
end
