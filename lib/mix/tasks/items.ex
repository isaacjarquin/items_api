import Ecto.Query
alias ItemsApi.Repo

defmodule Mix.Tasks.Items do
  @shortdoc "remove items no longer available and image from cloudinary"

  def remove do
    Enum.each items(), fn item ->
        with {:ok, cloudinary_response} <- remove_image_from_cludinary(item.image),
             {:ok, ecto_response} <- remove_item_from_db(item) do
        else
          {:error, error} -> IO.puts "#{error.result}"
        end
    end
  end

  defp remove_image_from_cludinary(image) do
    {:ok, response} = ExCloudinary.delete_image(public_id(image))

    if response.result == "not found" do
      {:error, response}
    else
      {:ok, response}
    end
  end

  defp remove_item_from_db(item) do
    Repo.delete(item)
  end

  defp items do
    Repo.all(query())
  end

  defp query do
    { :ok, today } = current_date()

    current_date_formatted = today |> Ecto.Date.cast!
    from i in ItemsApi.Item, where: i.item_removal_date == ^current_date_formatted
  end

  defp public_id(image) do
    # String.split(image, "/") |> List.last |> String.split(".") |> List.first
    image
    |> String.split("/")
    |> List.last
    |> String.split(".")
    |> List.first
  end

  defp current_date do
    DateTime.utc_now |>
    DateTime.to_unix |>
    DateTime.from_unix()
  end
end
