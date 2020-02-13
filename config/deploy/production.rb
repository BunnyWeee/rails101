# server-based syntax
# ======================
# Defines a single server with a list of roles and multiple properties.
# You can define all roles on a single server, or split them:

# server "example.com", user: "deploy", roles: %w{app db web}, my_property: :my_value
# server "example.com", user: "deploy", roles: %w{app web}, other_property: :other_value
# server "db.example.com", user: "deploy", roles: %w{db}
set :rails_env, 'production'

set :branch, 't21555'

set :deploy_to, '/home/deploy/rails101'
set :keep_releases, 10
role :app, %w[deploy@13.231.186.174]
role :web, %w[deploy@13.231.186.174]
role :db,  %w[deploy@13.231.186.174], primary: true

set :ssh_options, {
  user: 'deploy',
  forward_agent: true,
  port: 22
}
