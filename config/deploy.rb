require 'rvm/capistrano'
require 'bundler/capistrano'

set :rvm_ruby_string, '2.1.5'
set :rvm_type, :system
set :rails_env, 'production'

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :scm, :git
set :branch, 'master'
set :repository, 'https://github.com/dskecse/depot.git'

# role :web, "your web-server here"                          # Your HTTP server, Apache/etc
# role :app, "your app-server here"                          # This may be the same as your `Web` server
# role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"
server '178.62.205.136', :web, :app, :db, primary: true
set :bundle_without, [:development, :test]

set :ssh_options, forward_agent: true

set :user, 'deployer'
set :group, 'staff'
set :use_sudo, false

set :application, 'depot_production'
set :deploy_to, "/home/#{user}/#{application}"

set :keep_releases, 5

set :rake, "rvm use #{rvm_ruby_string} do bundle exec rake --trace"
set :bundle_cmd, "rvm use #{rvm_ruby_string} do bundle"

task :set_current_release, roles: :app do
  set :current_release, latest_release
end

set :unicorn_conf, "#{deploy_to}/current/config/unicorn.rb"
set :unicorn_pid, "#{deploy_to}/current/tmp/pids/unicorn.pid"
set :unicorn_start_cmd, "(cd #{deploy_to}/current && #{bundle_cmd} exec unicorn_rails -Dc #{unicorn_conf})"

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
namespace :deploy do
  desc 'reload the database with seed data'
  task :seed do
    run "cd #{deploy_to}/current && #{bundle_cmd} exec rake db:seed"
  end

  desc 'start application'
  task :start, roles: :app do
    run unicorn_start_cmd
  end

  desc 'stop application'
  task :stop, roles: :app do
    run "[ -f #{unicorn_pid} ] && kill -QUIT `cat #{unicorn_pid}`"
  end

  desc 'restart application'
  task :restart, roles: :app do
    run "[ -f #{unicorn_pid} ] && kill -USR2 `cat #{unicorn_pid}` || #{unicorn_start_cmd}"
  end
end

task :config_symlinks do
  # current_path is available as a variable
  run "#{try_sudo} ln -s #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  run "#{try_sudo} ln -s #{shared_path}/config/app_config.yml #{release_path}/config/app_config.yml"
end

default_run_options[:pty] = true

# # https://github.com/net-ssh/net-ssh/issues/145
# set :ssh_options, { config: false }

before 'deploy:assets:precompile', 'config_symlinks'

#after 'deploy:update',  'bundle:install'
#after 'deploy:update',  'deploy:assets:precompile'
#after 'deploy:restart', 'unicorn:reload'
