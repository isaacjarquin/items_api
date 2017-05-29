defmodule ItemsApi.Mocks.ExCloudinary do
  def delete_image(public_id) do
    {:ok, %{result: "ok"}}
  end
end
