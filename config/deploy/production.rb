role :app, %w(vagrant@127.0.0.1)
role :web, %w(vagrant@127.0.0.1)
role :db, %w(vagrant@127.0.0.1)

set :rails_env, 'production'
set :frontend_env, 'prod'
set :frontend_build_dir, 'productionbuild'
set :default_environment, 'RAILS_ENV' => 'production'

set :ssh_options, fetch(:ssh_options).merge(port: 2277)
set :branch, proc {
  version_file = File.join(File.dirname(__FILE__), '..', '..', 'VERSION')
  "v#{File.read(version_file).chomp}"
}.call
