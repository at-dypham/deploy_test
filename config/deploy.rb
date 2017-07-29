lock '3.3.5'

set :application, 'deploy_test'
set :repo_url, 'git@github.com:at-dypham/deploy_test.git'
set :deploy_to, '/root/dypham'

# set :use_sudo, false
# set :bundle_binstubs, nil
set :linked_files, fetch(:linked_files, []).push('/root/dypham/current/config/database.yml')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

after 'deploy:publishing', 'deploy:restart'

namespace :deploy do
  task :restart do
    invoke 'unicorn:reload'
  end
end
