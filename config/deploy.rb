require 'rvm/capistrano'
require 'bundler/capistrano'

set :rvm_ruby_string, '2.0.0@depot'

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :scm, :git
set :branch, 'master'
set :repository, 'https://github.com/dskecse/depot.git'

use_recipes :git, :rails, :rails_assets, :bundle, :unicorn

# role :web, "your web-server here"                          # Your HTTP server, Apache/etc
# role :app, "your app-server here"                          # This may be the same as your `Web` server
# role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"
server '178.62.205.136', :web, :app, :db, primary: true

set :user, 'deployer'
set :application, 'depot_production'
set :deploy_to, "home/#{user}/#{application}"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end

default_run_options[:pty] = true

# https://github.com/net-ssh/net-ssh/issues/145
set :ssh_options, { config: false }

#after 'deploy:update',  'bundle:install'
#after 'deploy:update',  'deploy:assets:precompile'
after 'deploy:restart', 'unicorn:reload'
