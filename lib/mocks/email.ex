defmodule ItemsApi.Mocks.Email do
  def customer_notification_email(send_email_to, contact_detail) do
    {:ok, "Notiffication setup correctly"}
  end
end
