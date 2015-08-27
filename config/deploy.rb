# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'Brahma'
set :repo_url, 'https://github.com/rajivrnair/brahma.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/home/rnair/deployments'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
set :format, :pretty

# Default value for :log_level is :debug
set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, %w{.env}

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

# RBENV
set :rbenv_type, :user # or :system, depends on your rbenv setup
set :rbenv_ruby, '2.2.2'

# in case you want to set ruby version from the file:
set :rbenv_ruby, File.read('.ruby-version').strip

set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby}
set :rbenv_roles, :all # default value

namespace :deploy do

  task :execute_on_server do
    on "deployer@128.199.216.161" do
      execute "cd brahma && git pull && ./run_me.sh"
    end
  end

end