require 'capistrano-deploy'
require 'rvm/capistrano'
require 'bundler/capistrano'

set :rvm_ruby_string, '2.0.0@depot'

before 'deploy:setup', 'rvm:install_rvm'
before 'deploy:setup', 'rvm:install_ruby'

use_recipes :git, :rails, :rails_assets, :bundle, :unicorn

set :application, 'depot_production'
set :deploy_to, "/home/depot/#{application}"

set :scm, :git
set :branch, 'master'
set :repository, 'https://github.com/dskecse/depot.git'

server '178.62.205.136', :web, :app, :db, primary: true

set :user, 'depot'

default_run_options[:pty] = true

# https://github.com/net-ssh/net-ssh/issues/145
set :ssh_options, { config: false }

#after 'deploy:update',  'bundle:install'
#after 'deploy:update',  'deploy:assets:precompile'
#after 'deploy:restart', 'unicorn:reload'

# if you want to clean up old releases on each deploy uncomment this:
after 'deploy', 'deploy:cleanup'
