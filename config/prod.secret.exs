use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :items_api, ItemsApi.Endpoint,
  secret_key_base: System.get_env("SECRET_KEY_BASE")

# Configure your database
config :items_api, ItemsApi.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env("DATABASE_URL"),
  username: System.get_env("DATABASE_USERNAME"),
  password: System.get_env("DATABASE_PASSWORD"),
  database: "items_api",
  pool_size: 15

config :items_api, ItemsApi.Mailer,
  adapter: Bamboo.SMTPAdapter,
  server: "smtp.gmail.com",
  port: 465,
  username: System.get_env("SMTP_USERNAME"),
  password: System.get_env("SMTP_PASSWORD"),
  tls: :if_available, # can be `:always` or `:never`
  ssl: true, # can be `true`
  retries: 1

# config :ex_cloudinary,
#   api_key: System.get_env("CLOUDINARY_API_KEY"),
#   api_secret: System.get_env("CLOUDINARY_API_SECRET"),
#   cloud_name: System.get_env("CLOUDINARY_CLOUD_NAME")
