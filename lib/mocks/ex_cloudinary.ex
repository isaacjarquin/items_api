defmodule ItemsApi.Mocks.ExCloudinary do
  def delete_image(public_id) do
    if public_id == "" do
      {:ok, %{result: "not found"}}
    else
      {:ok, %{result: "ok"}}
    end
  end
end
