defmodule ItemsApi.ContactDetailControllerTest do
  use ItemsApi.ConnCase

  alias ItemsApi.ContactDetail
  @valid_attrs %{details: "some content", email: "some content", item_id: 42, name: "some content", phone_number: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, contact_detail_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    contact_detail = Repo.insert! %ContactDetail{}
    conn = get conn, contact_detail_path(conn, :show, contact_detail)
    assert json_response(conn, 200)["data"] == %{"id" => contact_detail.id,
      "name" => contact_detail.name,
      "email" => contact_detail.email,
      "phone_number" => contact_detail.phone_number,
      "details" => contact_detail.details,
      "item_id" => contact_detail.item_id}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, contact_detail_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    Repo.insert! %ItemsApi.Item{id: 42, email: "item@item.com"}

    conn = post conn, contact_detail_path(conn, :create), contact_detail: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(ContactDetail, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, contact_detail_path(conn, :create), contact_detail: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    contact_detail = Repo.insert! %ContactDetail{}
    conn = put conn, contact_detail_path(conn, :update, contact_detail), contact_detail: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(ContactDetail, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    contact_detail = Repo.insert! %ContactDetail{}
    conn = put conn, contact_detail_path(conn, :update, contact_detail), contact_detail: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    contact_detail = Repo.insert! %ContactDetail{}
    conn = delete conn, contact_detail_path(conn, :delete, contact_detail)
    assert response(conn, 204)
    refute Repo.get(ContactDetail, contact_detail.id)
  end
end
