require "bundler/capistrano"
require "rvm/capistrano"
set :rvm_ruby_string, '1.9.3'

server "50.57.231.142", :web, :app, :db, :primary => true

set :application, "fashdev"
set :user, "facoteam1"
set :deploy_to, "/home/facoteam1/stores/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false
set :rails_env, "production"

set :repository, "git@github.com:andysher/fashdev.git"
set :scm, :git
set :branch, "master"


set :shell, '/bin/bash'

set :rvm_type, :system

default_run_options[:pty]=true
default_run_options[:shell]=false
ssh_options[:forward_agent]=true

after 'deploy', 'deploy:cleanup'
after 'deploy', 'deploy:migrate'

#ssh_options[:keys] = %w(/home/user/.ssh/id_rsa) # If you are using ssh_keysset :chmod755, "app config db lib public vendor script script/* public/disp*"set :use_sudo, false
 
# Passenger
namespace :deploy do
  task :start, :roles => :app do
    run "touch /home/facoteam1/stores/#{application}/current/tmp/restart.txt"
  end

  task :stop, :roles => :app do
    # Do nothing.
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch /home/facoteam1/stores/#{application}/current/tmp/restart.txt"
  end
end
