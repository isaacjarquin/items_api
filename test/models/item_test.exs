defmodule ItemsApi.ItemTest do
  use ItemsApi.ModelCase

  alias ItemsApi.Item

  @valid_attrs %{date: "2010-04-17 14:00:00", email: "some content", info: "some content", kind: "some content", location: "some content", name: "some content", size: "some content"}
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