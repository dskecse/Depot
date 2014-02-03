require 'rvm/capistrano'

set :rvm_ruby_string, :local
set :rvm_autolibs_flag, 'read-only'

before 'deploy:setup', 'rvm:install_rvm'
before 'deploy:setup', 'rvm:install_ruby'

require 'capistrano-deploy'
use_recipes :git, :rails, :rails_assets, :bundle, :unicorn

server '95.85.18.44', :web, :app, :db, primary: true
set :user, 'depot'
set :deploy_to, '/home/depot/web-app'
set :scm, :git
set :repository, 'git@github.com:dskecse/depot.git'

after 'deploy:update',  'bundle:install'
after 'deploy:update',  'deploy:assets:precompile'

after 'deploy:restart', 'unicorn:reload'

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"
