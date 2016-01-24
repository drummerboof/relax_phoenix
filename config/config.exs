# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :relax_phoenix, RelaxPhoenix.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "dlSwZdE04ogssf8Y/uaVnwgsEcqp54W6XzWBbO9LKIddomecP2kH6Z0BfhyHsTHz",
  render_errors: [view: RelaxPhoenix.V1.ErrorView, default_format: "json-api", accepts: ~w(json-api)],
  pubsub: [name: RelaxPhoenix.PubSub, adapter: Phoenix.PubSub.PG2]

# configure plugs
config :plug, :mimes, %{
  "application/vnd.api+json" => ["json-api"]
}

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# configure phoenix encoders
# config :phoenix, :format_encoders, "json-api": Poison

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false

# Configure Guardian
config :guardian, Guardian,
  allowed_algos: ["HS512"], # optional
  verify_module: Guardian.JWT,  # optional
  issuer: "RelaxPhoenix",
  ttl: { 30, :days },
  verify_issuer: true, # optional
  secret_key: "boCV1vyfHbFp4zFC6ZkmkoIDC9jw8kHyAhsV3g8WfZG++FUGVa0yH5D1HLbaddrosBlynKSEgyA4p/vBcQb/mQ",
  serializer: RelaxPhoenix.GuardianSerialiser,
  hooks: GuardianDb

# Configure GuardianDb
config :guardian_db, GuardianDb,
  repo: RelaxPhoenix.Repo

# Configure JaSerializer
config :ja_serializer,
  key_format: :underscored


# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
