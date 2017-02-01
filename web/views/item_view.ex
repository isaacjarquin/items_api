defmodule ItemsApi.ItemView do
  use ItemsApi.Web, :view

  def render("index.json", %{items: items}) do
    %{data: render_many(items, ItemsApi.ItemView, "item.json")}
  end

  def render("show.json", %{item: item}) do
    %{data: render_one(item, ItemsApi.ItemView, "item.json")}
  end

  def render("item.json", %{item: item}) do
    %{id: item.id,
      name: item.name,
      email: item.email,
      kind: item.kind,
      size: item.size,
      date: item.date,
      location: item.location,
      info: item.info}
  end
end
