
server "benerino.com", :app, :web, :db, :primary => true

set :user, 'demo'
set :keep_releases, 3 
set :repository,  "git@github.com:benhall2121/ddb.git" # replace neerajdotname with your github username
set :use_sudo, false
set :scm, :git
set :deploy_via, :copy

# this will make sure that capistrano checks out the submodules if any
set :git_enable_submodules, 1

set :application, 'ddb' # replace gitlearn with your application name
set (:deploy_to) { "/home/#{user}/apps/#{application}" }

ssh_options[:port] = 30000