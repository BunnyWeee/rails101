# config valid for current version and patch releases of Capistrano
lock "~> 3.12.0"

set :application, "rails101"

set :repo_url, "git@github.com:BunnyWeee/rails101.git"

set :branch, "t21555"

set :deploy_to, "home/deploy/rail/rails101"

set :default_env, { path: "~/.rbenv/shims:~/.rbenv/bin:$PATH" }

append :linked_files, "config/database.yml", "config/secrets.yml", "config/settings.yml"

append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system", '.bundle'