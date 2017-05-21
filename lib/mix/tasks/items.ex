import Ecto.Query
alias ItemsApi.Repo

defmodule Mix.Tasks.Items do
  @shortdoc "remove items no longer available and image from cloudinary"

  def remove do
    {:ok, date} = DateTime.utc_now |> DateTime.to_unix |> (+ 2592000) |> DateTime.from_unix()

    formatted_date = date |> Ecto.Date.cast!
    query = from i in ItemsApi.Item, where: i.item_removal_date == ^formatted_date
    # query = from i in ItemsApi.Item, where: i.item_removal_date == Date.Ecto.utc
    items = Repo.all(query)
  end
end
