use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :founders, Founders.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :founders, Founders.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "founders_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# speed up password hashing in test environment.
config :comeonin, :bcrypt_log_rounds, 4
