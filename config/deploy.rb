# config valid for current version and patch releases of Capistrano
lock "~> 3.12.0"

set :application, "rails101"

set :repo_url, "git@github.com:BunnyWeee/rails101.git"

set :branch, "t21555"

set :deploy_to, "home/deploy/rail/rails101"

set :rbenv_type, :user # or :system, depends on your rbenv setup
set :rbenv_ruby, '2.6.3'
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, :all # default value

append :linked_files, "config/database.yml", "config/secrets.yml", "config/settings.yml"

append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system", '.bundle'