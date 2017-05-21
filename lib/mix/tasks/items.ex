import Ecto.Query
alias ItemsApi.Repo

defmodule Mix.Tasks.Items do
  @shortdoc "remove items no longer available and image from cloudinary"

  def remove do
    { :ok, today } = current_date()

    current_date_formatted = today |> Ecto.Date.cast!
    query = from i in ItemsApi.Item, where: i.item_removal_date == ^current_date_formatted
    # query = from i in ItemsApi.Item, where: i.item_removal_date == Date.Ecto.utc
    items = Repo.all(query)
  end

  def current_date do
    DateTime.utc_now |>
    DateTime.to_unix |>
    (+ 2592000) |>
    DateTime.from_unix()
  end
end
