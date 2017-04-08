defmodule ItemsApi.ContactUsControllerTest do
  use ItemsApi.ConnCase

  alias ItemsApi.ContactUs
  @valid_attrs %{details: "some content", email: "some content", email_sent: true, name: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, contact_us_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    contact_us = Repo.insert! %ContactUs{}
    conn = get conn, contact_us_path(conn, :show, contact_us)
    assert json_response(conn, 200)["data"] == %{"id" => contact_us.id,
      "name" => contact_us.name,
      "email" => contact_us.email,
      "details" => contact_us.details,
      "email_sent" => contact_us.email_sent}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, contact_us_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, contact_us_path(conn, :create), contact_us: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(ContactUs, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, contact_us_path(conn, :create), contact_us: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    contact_us = Repo.insert! %ContactUs{}
    conn = put conn, contact_us_path(conn, :update, contact_us), contact_us: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(ContactUs, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    contact_us = Repo.insert! %ContactUs{}
    conn = put conn, contact_us_path(conn, :update, contact_us), contact_us: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    contact_us = Repo.insert! %ContactUs{}
    conn = delete conn, contact_us_path(conn, :delete, contact_us)
    assert response(conn, 204)
    refute Repo.get(ContactUs, contact_us.id)
  end
end
