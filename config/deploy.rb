set :application, "Julekalender"
set :asset_env, "#{asset_env} RAILS_RELATIVE_URL_ROOT=/julekalender"
set :repository,  "git@github.com:Th0Truck/julekalender"
set :scm, :git
set :deploy_via, :remote_cache
set :keep_releases, 3
set :deploy_to, "/var/www/#{application}"
#set :scm # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :keep_releases, 5
after "deploy:restart", "deploy:cleanup"
set :scm_user, "root"
require "bundler/capistrano"
role :web, "10.34.255.233"                          # Your HTTP server, Apache/etc
role :app, "10.34.255.233"                          # This may be the same as your `Web` server
role :db,  "10.34.255.233", :primary => true # This is where Rails migrations will run
role :db,  "10.34.255.233"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end