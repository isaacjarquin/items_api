# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :items_api, ItemsApi.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "OddcJxrhcgEmx4K+EKX4g3sUXdJklJ6tfWjftTVbHRdv8H5q8+lBx0iPa4pbHQqG",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: ItemsApi.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false

config :items_api, ecto_repos: [ItemsApi.Repo]

config :quantum, :items_api,
  cron: [
    # Every minute
    # "* * * * *":  { Mix.Tasks.Items, :remove },
    # Runs every midnight:
    "@daily": { Mix.Tasks.Items, :remove }
  ]

config :ex_cloudinary,
    api_key: "",
    api_secret: "",
    cloud_name: ""
