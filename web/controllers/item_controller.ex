defmodule ItemsApi.ItemController do
  use ItemsApi.Web, :controller

  alias ItemsApi.Item

  plug :scrub_params, "item" when action in [:create, :update]

  def index(conn, %{"petType" => petType, "petStatus" => petStatus}) do
    query = from i in Item, where: i.kind == ^petType and i.status == ^petStatus
    items = Repo.all(query)
    render(conn, "index.json", items: items)
  end

  def index(conn, %{"petType" => petType}) do
    query = from i in Item, where: i.kind == ^petType
    items = Repo.all(query)
    render(conn, "index.json", items: items)
  end

  def index(conn, %{"petStatus" => petStatus}) do
    query = from i in Item, where: i.status == ^petStatus
    items = Repo.all(query)
    render(conn, "index.json", items: items)
  end

  def index(conn, params) do
    items = Repo.all(Item)
    render(conn, "index.json", items: items)
  end

  def create(conn, %{"item" => item_params}) do
    changeset = Item.changeset(%Item{}, item_params)

    case Repo.insert(changeset) do
      {:ok, item} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", item_path(conn, :show, item))
        |> render("show.json", item: item)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(ItemsApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    item = Repo.get!(Item, id)
    render(conn, "show.json", item: item)
  end

  def update(conn, %{"id" => id, "item" => item_params}) do
    item = Repo.get!(Item, id)
    changeset = Item.changeset(item, item_params)

    case Repo.update(changeset) do
      {:ok, item} ->
        render(conn, "show.json", item: item)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(ItemsApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    item = Repo.get!(Item, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(item)

    send_resp(conn, :no_content, "")
  end
end
