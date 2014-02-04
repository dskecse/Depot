require 'capistrano-deploy'
require 'rvm/capistrano'
require 'bundler/capistrano'

use_recipes :git, :rails, :rails_assets, :bundle, :unicorn

set :scm, :git
set :repository, 'git@github.com:dskecse/depot.git'

server '95.85.18.44', :web, :app, :db, primary: true
set :user, 'depot'
set :deploy_to, '/home/depot/web-app'

after 'deploy:update',  'bundle:install'
after 'deploy:update',  'deploy:assets:precompile'
after 'deploy:restart', 'unicorn:reload'

# if you want to clean up old releases on each deploy uncomment this:
after 'deploy:restart', 'deploy:cleanup'
