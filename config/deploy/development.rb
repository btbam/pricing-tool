role :app, %w(localhost)
role :web, %w(localhost)
role :db, %w(localhost)

set :rails_env, 'development'
set :frontend_env, 'dev'
set :frontend_build_dir, 'build'
set :default_environment, 'RAILS_ENV' => 'development'

set :bundle_without, nil
ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call
