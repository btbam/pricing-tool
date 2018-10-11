# config valid only for current version of Capistrano
lock '3.3.5'

set :application, 'pricing_tool'
set :repo_url, 'git@dashboard:pricing_tool.git'
set :local_root, File.realpath(File.join(File.dirname(__FILE__), '..'))

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/srv/#{fetch(:application)}"

# Frontend deploy path helpers
def frontend_deploy_path
  deploy_path.join('frontend')
end

def frontend_current_path
  frontend_deploy_path.join('current')
end

def frontend_releases_path
  frontend_deploy_path.join('releases')
end

def frontend_release_path
  fetch(:frontend_release_path)
end

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
set :log_level, :info

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('config/database.yml', '.env')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log',
                                               'tmp/pids',
                                               'tmp/cache',
                                               'tmp/sockets',
                                               'vendor/bundle')

# Default value for default_env is {}
set :default_env,
    'LANG' => 'en_US.UTF-8',
    'LC_ALL' => 'en_US.UTF-8',
    'LD_LIBRARY_PATH' => '/opt/oracle/instantclient_11_2',
    'NLS_LANG' => 'AMERICAN_AMERICA.AL32UTF8'

# Default value for keep_releases is 5
# set :keep_releases, 5

set :ssh_options,
    keys: ['~/.ssh/id_rsa'],
    forward_agent: true,
    user: 'vagrant',
    port: 22

namespace :deploy do
  desc 'Start web'
  task :start do
    on roles :app do
      invoke 'unicorn:start'
    end
  end

  desc 'Stop web'
  task :stop do
    on roles :app do
      invoke 'unicorn:stop'
    end
  end

  desc 'Restart web'
  task :restart do
    on roles :app do
      invoke 'unicorn:restart'
    end
  end

  desc 'Upload local database.yml to remote shared/config/database.yml'
  task :upload_database_yml do
    on roles :app do
      database_yml = 'config/database.yml'
      local_path = File.join(fetch(:local_root), database_yml)
      remote_path = File.join(shared_path, database_yml)
      execute :mkdir, '-p', File.dirname(remote_path)
      upload!(local_path, remote_path)
    end
  end

  desc 'Upload local .env to remote shared/.env'
  task :upload_dotenv do
    on roles :app do
      dotenv = '.env'
      local_path = File.join(fetch(:local_root), dotenv)
      remote_path = File.join(shared_path, dotenv)
      execute :mkdir, '-p', File.dirname(remote_path)
      upload!(local_path, remote_path)
    end
  end
end

namespace :frontend do
  desc 'Build and link the frontend'
  task :build_and_link do
    invoke 'frontend:release_path'
    invoke 'frontend:build'
    invoke 'frontend:link'
    invoke 'frontend:cleanup'
  end

  task :rollback do
    invoke 'frontend:build_and_link'
    on roles :app do
      releases = capture(:ls, '-xt', frontend_releases_path).split
      execute :rm, '-rf', frontend_releases_path.join(releases[1])
    end
  end

  task :release_path do
    on roles :app do
      releases = capture(:ls, '-xt', releases_path).split
      set(:frontend_release_path, frontend_releases_path.join(releases[0]))
    end
  end

  task :init do
    on roles :app do
      execute :mkdir, '-p',
              frontend_deploy_path,
              frontend_releases_path,
              frontend_release_path
    end
  end

  task :copy do
    on roles :app do
      execute :rsync, '-a',
              '--exclude', 'bower_components',
              '--exclude', 'node_modules',
              "#{release_path}/frontend/", "#{frontend_release_path}"
    end
  end

  task build: ['init', 'copy', 'build:npm_install', 'build:bower_install', 'build:gulp']

  namespace :build do
    task :clean do
      on roles :app do
        within frontend_release_path do
          execute :rm, '-rf', 'bower_components', 'node_modules'
        end
      end
    end

    task :npm_install do
      on roles :app do
        within frontend_release_path do
          execute :npm, 'install'
        end
      end
    end

    task :bower_install do
      on roles :app do
        execute "cd '#{frontend_release_path}' ; bower install | cat"
      end
    end

    task :gulp do
      on roles :app do
        within frontend_release_path do
          execute :gulp, '--stage', fetch(:frontend_env), 'build'
        end
      end
    end
  end

  task :link do
    on roles :app do
      to_path = frontend_current_path
      execute <<-COMMAND
          [ ! -h '#{to_path}' ] && rm -rf '#{to_path}'
          ln -snf '#{frontend_release_path}' '#{to_path}'
      COMMAND
    end
  end

  desc 'Clean up old frontend releases'
  task :cleanup do
    on roles :app do |host|
      releases_path = frontend_releases_path
      keep_releases = fetch(:keep_releases)
      releases = capture(:ls, '-xtr', releases_path).split
      if releases.count >= keep_releases
        info t(:keeping_releases, host: host.to_s, keep_releases: keep_releases, releases: releases.count)
        directories = (releases - releases.last(keep_releases))
        if directories.any?
          directories_str = directories.map do |release|
            releases_path.join(release)
          end.join(' ')
          execute :rm, '-rf', directories_str
        else
          info t(:no_old_releases, host: host.to_s, keep_releases: keep_releases)
        end
      end
    end
  end
end

namespace :unicorn do
  desc 'Start unicorn'
  task :start do
    on roles :app do
      execute 'sudo initctl start pricing-tool-backend'
    end
  end

  desc 'Stop unicorn'
  task :stop do
    on roles :app do
      execute 'sudo initctl stop pricing-tool-backend'
    end
  end

  desc 'Restart unicorn'
  task :restart do
    on roles :app do
      execute 'sudo initctl restart pricing-tool-backend'
    end
  end

  desc 'Reload unicorn workers'
  task :reload do
    on roles :app do
      execute 'sudo initctl reload pricing-tool-backend'
    end
  end
end

namespace :nginx do
  desc 'Start nginx'
  task :start do
    on roles :app do
      execute 'sudo service nginx start'
    end
  end

  desc 'Stop nginx'
  task :stop do
    on roles :app do
      execute 'sudo service nginx stop'
    end
  end

  desc 'Restart nginx'
  task :restart do
    on roles :app do
      invoke 'nginx:stop'
      invoke 'nginx:start'
    end
  end

  desc 'Reload nginx configs'
  task :reload do
    on roles :app do
      execute 'sudo service nginx reload'
    end
  end
end

after :deploy, 'frontend:build_and_link'
after :deploy, 'deploy:restart'
after 'deploy:rollback', 'frontend:rollback'
after 'deploy:rollback', 'deploy:restart'
