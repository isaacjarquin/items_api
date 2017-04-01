defmodule ItemsApi.ContactDetailTest do
  use ItemsApi.ModelCase

  alias ItemsApi.ContactDetail

  @valid_attrs %{details: "some content", email: "some content", item_id: 42, name: "some content", phone_number: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = ContactDetail.changeset(%ContactDetail{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = ContactDetail.changeset(%ContactDetail{}, @invalid_attrs)
    refute changeset.valid?
  end
end
