defmodule ItemsApi.Email do
  use Bamboo.Phoenix, view: ItemsApi.EmailView

  def customer_notification_email(email_address, contact_detail) do
    new_email
    |> to(email_address)
    |> from("myfoundpet@gmail.com")
    |> subject("Dueño de la mascota")
    |> text_body(build_message(contact_detail))
  end

  def contact_us_email(user_email) do
    new_email
    |> to("myfoundpet@gmail.com")
    |> from(user_email)
    |> subject("Welcome!")
    |> text_body("Welcome to My Lost Pet!")
  end

  def build_message(contact_detail) do
    "#{contact_detail.details} \n
    Mis detalles de contacto son: \n
    Teléfono: #{contact_detail.phone_number} \n
    Correo: #{contact_detail.email} \n
    Por favor póngase en contacto lo antes posible conmigo \n\n\n\n
    Atentamente #{contact_detail.name}"
  end
end
