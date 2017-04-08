defmodule ItemsApi.ContactUsTest do
  use ItemsApi.ModelCase

  alias ItemsApi.ContactUs

  @valid_attrs %{details: "some content", email: "some content", email_sent: true, name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = ContactUs.changeset(%ContactUs{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = ContactUs.changeset(%ContactUs{}, @invalid_attrs)
    refute changeset.valid?
  end
end
