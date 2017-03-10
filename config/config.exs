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


# In this section you can find all the necessary configuration for monitoring
# with prometheus and graphana.

config :prometheus, ItemsApi.PhoenixInstrumenter,
  controller_call_labels: [:controller, :action],
  duration_buckets: [10, 25, 50, 100, 250, 500, 1000, 2500, 5000,
                     10_000, 25_000, 50_000, 100_000, 250_000, 500_000,
                     1_000_000, 2_500_000, 5_000_000, 10_000_000],
  registry: :default,
  duration_unit: :microseconds

config :prometheus, ItemsApi.PipelineInstrumenter,
  labels: [:status_class, :method, :host, :scheme, :request_path],
  duration_buckets: [10, 100, 1_000, 10_000, 100_000,
                     300_000, 500_000, 750_000, 1_000_000,
                     1_500_000, 2_000_000, 3_000_000],
  registry: :default,
  duration_unit: :microseconds

# as well as ...
config :items_api, ItemsApi.Repo,
  adapter: Ecto.Adapters.Postgres,
  loggers: [ItemsApi.RepoInstrumenter] # and maybe Ecto.LogEntry? Up to you
