# server-based syntax
# ======================
# Defines a single server with a list of roles and multiple properties.
# You can define all roles on a single server, or split them:

# server "example.com", user: "deploy", roles: %w{app db web}, my_property: :my_value
# server "example.com", user: "deploy", roles: %w{app web}, other_property: :other_value
# server "db.example.com", user: "deploy", roles: %w{db}
set :rails_env, 'production'

set :branch, 't21555'

set :deploy_to, '/home/apps/rails101'
set :keep_releases, 10
role :app, %w[apps@54.238.201.191]
role :web, %w[apps@54.238.201.191]
role :db,  %w[apps@54.238.201.191], primary: true

set :ssh_options, {
  forward_agent: true,
  port: 22
}
