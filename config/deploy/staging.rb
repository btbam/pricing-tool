role :app, %w(vagrant@127.0.0.1)
role :web, %w(vagrant@127.0.0.1)
role :db, %w(vagrant@127.0.0.1)

set :rails_env, 'staging'
set :frontend_env, 'staging'
set :frontend_build_dir, 'productionbuild'
set :default_environment, 'RAILS_ENV' => 'staging'

set :ssh_options, fetch(:ssh_options).merge(port: 2233)
ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call
