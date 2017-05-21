defmodule Mix.Tasks.Items do
  @shortdoc "remove items no longer available and image from cloudinary"

  def remove do
    # item = Repo.all(ItemsApi.Item, contact_detail_params["item_id"])

    IO.puts "Remove all the pets that are no longer available"
  end
end
