defmodule ItemsApi.Mocks.Mailer do
  def deliver_now(_) do
    {:ok, "email successfully delivered"}
  end
end
