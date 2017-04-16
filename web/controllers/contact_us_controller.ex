defmodule ItemsApi.ContactUsController do
  use ItemsApi.Web, :controller

  alias ItemsApi.ContactUs

  @email Application.get_env(:items_api, :email)
  @mailer Application.get_env(:items_api, :mailer)

  def index(conn, _params) do
    contact_us = Repo.all(ContactUs)
    render(conn, "index.json", contact_us: contact_us)
  end

  def create(conn, %{"contact_us" => contact_us_params}) do
    changeset = ContactUs.changeset(%ContactUs{}, contact_us_params)

    case Repo.insert(changeset) do
      {:ok, contact_us} ->
        @email.contact_us_email(contact_us) |> @mailer.deliver_now
        conn
        |> put_status(:created)
        |> put_resp_header("location", contact_us_path(conn, :show, contact_us))
        |> render("show.json", contact_us: contact_us)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(ItemsApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    contact_us = Repo.get!(ContactUs, id)
    render(conn, "show.json", contact_us: contact_us)
  end

  def update(conn, %{"id" => id, "contact_us" => contact_us_params}) do
    contact_us = Repo.get!(ContactUs, id)
    changeset = ContactUs.changeset(contact_us, contact_us_params)

    case Repo.update(changeset) do
      {:ok, contact_us} ->
        render(conn, "show.json", contact_us: contact_us)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(ItemsApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    contact_us = Repo.get!(ContactUs, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(contact_us)

    send_resp(conn, :no_content, "")
  end
end
