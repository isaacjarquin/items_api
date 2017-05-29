import Ecto.Query
alias ItemsApi.Repo

defmodule Mix.Tasks.Items do
  @shortdoc "remove items no longer available and image from cloudinary"
  @ex_cloudinary Application.get_env(:items_api, :ex_cloudinary)

  def remove(now \\ DateTime.utc_now) do
    Enum.each items(now), fn item ->
        with {:ok, cloudinary_response} <- remove_image_from_cludinary(item.image),
             {:ok, ecto_response} <- remove_item_from_db(item) do
        end
    end
  end

  defp remove_image_from_cludinary(image) do
    {:ok, response} = public_id(image) |> @ex_cloudinary.delete_image()

    if response.result == "not found" do
      {:error, response}
    else
      {:ok, response}
    end
  end

  defp remove_item_from_db(item) do
    Repo.delete(item)
  end

  defp items(now) do
    { :ok, today } = current_date(now)

    today
    |> Ecto.Date.cast!
    |> query
    |> Repo.all
  end

  defp query(current_date_formatted) do
    from i in ItemsApi.Item, where: i.item_removal_date == ^current_date_formatted
  end

  defp public_id(image) do
    image
    |> String.split("/")
    |> List.last
    |> String.split(".")
    |> List.first
  end

  defp current_date(now) do
    now
    |> DateTime.to_unix
    |> DateTime.from_unix
  end
end
