# -*- mode: ruby -*-
# vi: set ft=ruby :

# workaround for Vagrant on Windows
def home_file(filename)
  [ENV['HOMEPATH'], ENV['HOME'], ENV['USERPROFILE']].compact.each do |home_path|
    path = File.join(home_path, filename)
    return File.realpath(path) if File.exist?(path)
  end
end

def rails_env
  @rails_env ||= ENV['RAILS_ENV'] || 'development'
end

def frontend_stage
  '--stage prod' if %w(staging production).include?(rails_env)
end

def dev_path
  File.join('', 'srv', 'pricing_tool', 'dev')
end

def frontend_path
  File.join('', 'srv', 'pricing_tool', 'frontend', 'dev')
end

def frontend_excludes
  %w(bower_components node_modules)
end

def guest_frontend?
  ENV['ENABLE_FRONTEND']
end

Vagrant.configure(2) do |config|
  config.vm.box = 'ubuntu/trusty64'
  config.vm.synced_folder '.', '/vagrant', disabled: true
  config.vm.synced_folder 'vagrant', '/vagrant'

  # initialize some paths
  config.vm.provision :shell, inline: <<-EOF
mkdir -m775 -p /srv/pricing_tool
mkdir -m775 -p /srv/pricing_tool/frontend
mkdir -m775 -p /srv/pricing_tool/frontend/releases
mkdir -m775 -p /srv/pricing_tool/releases
mkdir -m775 -p /srv/pricing_tool/shared/log
mkdir -m775 -p /srv/pricing_tool/shared/tmp/pids
mkdir -m775 -p /srv/pricing_tool/shared/tmp/sockets
chown -f vagrant:vagrant /srv/pricing_tool
chown -Rf vagrant:vagrant /srv/pricing_tool/frontend/releases
chown -Rf vagrant:vagrant /srv/pricing_tool/releases
chown -Rf vagrant:vagrant /srv/pricing_tool/shared
ln -snf #{dev_path} /srv/pricing_tool/current
chown -hf vagrant:vagrant /srv/pricing_tool/current
ln -snf #{frontend_path} /srv/pricing_tool/frontend/current
chown -hf vagrant:vagrant /srv/pricing_tool/frontend/current
  EOF

  case rails_env
  when 'production'
    config.vm.synced_folder '.', '/srv/elasticsearch'

    # we need these for the initial up, but we don't need to keep them synced in production
    if guest_frontend?
      config.vm.provision :file, source: 'frontend', destination: frontend_path
      config.vm.provision :shell, inline: "cd #{frontend_path} && rm -rf '#{frontend_excludes.join("' '")}'"
    end

    config.vm.network :forwarded_port, guest: 22, host: 2277, id: 'ssh'
    config.vm.network :forwarded_port, guest: 7777, host: 7777
    config.vm.network :forwarded_port, guest: 5677, host: 5677
    config.vm.network :forwarded_port, guest: 9333, host: 9333
    config.vm.provider 'virtualbox' do |vb|
      vb.memory = 32 * 1024
      vb.cpus = 3
    end
  when 'staging'
    config.vm.synced_folder '.', '/srv/elasticsearch'

    # we need these for the initial up, but we don't need to keep them synced in production
    if guest_frontend?
      config.vm.provision :file, source: 'frontend', destination: frontend_path
      config.vm.provision :shell, inline: "cd #{frontend_path} && rm -rf '#{frontend_excludes.join("' '")}'"
    end

    config.vm.network :forwarded_port, guest: 22, host: 2233, id: 'ssh'
    config.vm.network :forwarded_port, guest: 3333, host: 3333
    config.vm.network :forwarded_port, guest: 5633, host: 5633
    config.vm.network :forwarded_port, guest: 9777, host: 9777
    config.vm.provider 'virtualbox' do |vb|
      vb.memory = 16 * 1024
      vb.cpus = 1
    end
  else
    config.vm.synced_folder '.', dev_path
    if guest_frontend?
      config.vm.synced_folder 'frontend', frontend_path,
                              type: 'rsync',
                              rsync__exclude: frontend_excludes,
                              owner: 'vagrant',
                              group: 'vagrant'
    end

    config.vm.network :forwarded_port, guest: 3000, host: 3000
    config.vm.network :forwarded_port, guest: 9000, host: 9000
    config.vm.network :forwarded_port, guest: 9200, host: 9200
    config.vm.provider 'virtualbox' do |vb|
      vb.memory = 4 * 1024
      vb.cpus = 2
    end
  end

  config.ssh.insert_key = false
  config.ssh.forward_agent = true
  config.ssh.private_key_path = [
    home_file(File.join('.vagrant.d', 'insecure_private_key')),
    home_file(File.join('.ssh', 'id_rsa'))
  ]
  config.vm.provision :shell, privileged: false, inline: <<-EOF
cat /vagrant/ssh/append_authorized_keys > /home/vagrant/.ssh/authorized_keys
cat /vagrant/ssh/known_hosts > /home/vagrant/.ssh/known_hosts
cat /vagrant/ssh/deploy-user_rsa > /home/vagrant/.ssh/id_rsa
chmod -Rf go-rwx /home/vagrant/.ssh
  EOF

  packages = %w(
    build-essential git vim wget
    libpq-dev libaio-dev libsqlite3-dev
    openjdk-7-jdk elasticsearch
    memcached
    redis-server redis-tools
    ruby2.1 ruby2.1-dev
    libcurl3 libcurl3-gnutls libcurl4-openssl-dev
    mailutils
    nginx
  )

  environment_vars = %W(
    LANG="en_US.UTF-8"
    LC_ALL="en_US.UTF-8"
    LD_LIBRARY_PATH="/opt/oracle/instantclient_11_2"
    NLS_LANG="AMERICAN_AMERICA.AL32UTF8"
    RAILS_ENV="#{rails_env}"
  )
  environment_str = environment_vars.join(' ')
  environment_file = environment_vars.join("\n")

  config.vm.provision :shell, inline: <<-EOF
apt-key add /vagrant/key1
apt-add-repository -y ppa:chris-lea/redis-server
apt-add-repository -y ppa:brightbox/ruby-ng
if [ ! -f /etc/apt/sources.list.d/elasticsearch.list ] ; then
  cp /vagrant/elasticsearch.list /etc/apt/sources.list.d
  wget -qO - http://packages.elasticsearch.org/GPG-KEY-elasticsearch | apt-key add -
fi

export DEBIAN_FRONTEND=noninteractive
apt-get update -y
apt-get install -y #{packages.join(' ')}

# Oracle client library
mkdir -p /opt/oracle
cp -r /vagrant/instantclient_11_2 /opt/oracle/instantclient_11_2
cd /opt/oracle/instantclient_11_2
[ -h libclntsh.so ] || ln -snf libclntsh.so.11.1 libclntsh.so

# Oracle client vars for the ruby-oci8 gem
if ! grep '#{environment_file}' /etc/environment &>/dev/null ; then
  echo '#{environment_file}' >> /etc/environment
fi

# Elasticsearch
cp /vagrant/#{rails_env}/elasticsearch/elasticsearch.yml /etc/elasticsearch/elasticsearch.yml
update-rc.d elasticsearch defaults 95 10
service elasticsearch restart

# Ruby
gem install bundler:1.9.8
cp /vagrant/#{rails_env}/pricing-tool-backend.upstart /etc/init/pricing-tool-backend.conf

# Nginx
rm -f /etc/nginx/sites-enabled/default
cp /vagrant/#{rails_env}/nginx/pricing-tool-*.conf /etc/nginx/sites-available
#{'ln -snf /etc/nginx/sites-available/pricing-tool-frontend.conf /etc/nginx/sites-enabled' if guest_frontend?}
ln -snf /etc/nginx/sites-available/pricing-tool-backend.conf /etc/nginx/sites-enabled
service nginx restart

# Node.js, etc.
if ! ( command -v node && [ -d /usr/local/lib/node ] ); then
  cd /tmp
  rm -rf node*
  wget -q http://nodejs.org/dist/v0.10.35/node-v0.10.35-linux-x64.tar.gz
  tar xzf node-v0.10.35-linux-x64.tar.gz
  mv node-v0.10.35-linux-x64 /usr/local/lib/node
fi
/usr/local/lib/node/bin/npm install -g npm
ln -snf /usr/local/lib/node/bin/node /usr/local/bin
ln -snf /usr/local/lib/node/lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npm
npm install -g bower gulp
chown -R vagrant:vagrant /home/vagrant
  EOF

  # Finish setting up the backend (non-privileged shell)
  config.vm.provision :shell, privileged: false, inline: <<-EOF
cd #{dev_path}
env #{environment_str} bundle install
env #{environment_str} bundle exec rake db:create db:migrate
  EOF

  # Start the backend
  config.vm.provision :shell, inline: 'start pricing-tool-backend || true'

  if guest_frontend?
    # Finish setting up the frontend (non-privileged shell)
    config.vm.provision :shell, privileged: false, inline: <<-EOF
cd #{frontend_path}
npm cache clean
npm install
bower install | cat # the pipe prevents questions
gulp #{frontend_stage} build
    EOF
  end
end
