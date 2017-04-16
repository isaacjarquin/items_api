defmodule ItemsApi.Mocks.Email do
  def customer_notification_email(send_email_to, contact_detail) do
    {:ok, "Notiffication setup correctly"}
  end

  def contact_us_email(details) do
    {:ok, "Notiffication setup correctly"}
  end
end
