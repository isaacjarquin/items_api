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
      breed: item.breed,
      size: item.size,
      date: item.date,
      location: item.location,
      autonomous_comunity: item.autonomous_comunity,
      province: item.province,
      image: item.image,
      latitud: item.latitud,
      longitud: item.longitud,
      info: item.info}
  end
end
