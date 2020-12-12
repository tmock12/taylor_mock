# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :taylor_mock,
  ecto_repos: [TaylorMock.Repo]

config :taylor_mock,
       TaylorMock.Repo,
       migration_timestamps: [type: :utc_datetime_usec],
       migration_primary_key: [
         name: :id,
         type: :binary_id,
         autogenerate: false,
         read_after_writes: true,
         default: {:fragment, "uuid_generate_v4()"}
       ]

# Configures the endpoint
config :taylor_mock, TaylorMockWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ULMfARyhG2fz9wUltiVxZshMMy+t45p3Lleoz9kwsALiHsUQUJM5Tq4ApjYMBl2R",
  render_errors: [view: TaylorMockWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: TaylorMock.PubSub,
  live_view: [signing_salt: "k3v3F7Ij"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
