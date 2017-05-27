import Ecto.Query
alias ItemsApi.Repo

defmodule Mix.Tasks.Items do
  @shortdoc "remove items no longer available and image from cloudinary"

  def remove do
    { :ok, today } = current_date()

    current_date_formatted = today |> Ecto.Date.cast!
    query = from i in ItemsApi.Item, where: i.item_removal_date == ^current_date_formatted

    items = Repo.all(query)
    remove_images_from_cloudinary(items)
    remove_items(items)
  end

  def remove_images_from_cloudinary(items) do
    Enum.each items, fn item ->
      api_key = "519722633886756"
      api_secret = "-Q2vKAsLho_6eSiXY4cnX0B6M5s"
      postdata = URI.encode_query(public_id: "wgk2zfytfpxr1n8uf2ew")
      delete_url = 'https://519722633886756:-Q2vKAsLho_6eSiXY4cnX0B6M5s@api.cloudinary.com/v1_1/my-lost-pet/image/destroy'
      HTTPoison.post(delete_url, postdata)
    end
    # Enum.each items,  fn item -> {IO.puts "#{item.image}"} end
  end

  def remove_items(items) do
    # Enum.each items,  fn item ->
    #   item = Repo.get!(Item, item.id)
    #   Repo.delete!(item)
    # end
  end

  def current_date do
    DateTime.utc_now |>
    DateTime.to_unix |>
    DateTime.from_unix()
  end
end
