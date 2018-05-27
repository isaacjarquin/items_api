defmodule ItemsApi.ItemTest do
  use ItemsApi.ModelCase

  alias ItemsApi.Item

  @valid_attrs %{date: "2010-04-17", email: "some content", info: "some content", kind: "some content", breed: "some content", name: "some content", latitud: "some latitud", longitud: "some longitud", size: "some content", location: "some location", image: "some content", autonomous_comunity:  nil, latitud: nil, longitud: nil, province: nil,}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Item.changeset(%Item{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Item.changeset(%Item{}, @invalid_attrs)
    refute changeset.valid?
  end
end
