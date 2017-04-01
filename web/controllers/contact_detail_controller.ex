defmodule ItemsApi.ContactDetailController do
  use ItemsApi.Web, :controller

  alias ItemsApi.ContactDetail

  def index(conn, _params) do
    contact_details = Repo.all(ContactDetail)
    render(conn, "index.json", contact_details: contact_details)
  end

  def create(conn, %{"contact_detail" => contact_detail_params}) do
    changeset = ContactDetail.changeset(%ContactDetail{}, contact_detail_params)
    case Repo.insert(changeset) do
      {:ok, contact_detail} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", contact_detail_path(conn, :show, contact_detail))
        |> render("show.json", contact_detail: contact_detail)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(ItemsApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    contact_detail = Repo.get!(ContactDetail, id)
    render(conn, "show.json", contact_detail: contact_detail)
  end

  def update(conn, %{"id" => id, "contact_detail" => contact_detail_params}) do
    contact_detail = Repo.get!(ContactDetail, id)
    changeset = ContactDetail.changeset(contact_detail, contact_detail_params)

    case Repo.update(changeset) do
      {:ok, contact_detail} ->
        render(conn, "show.json", contact_detail: contact_detail)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(ItemsApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    contact_detail = Repo.get!(ContactDetail, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(contact_detail)

    send_resp(conn, :no_content, "")
  end
end
