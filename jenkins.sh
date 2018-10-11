#!/bin/bash -l

set -e

export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'
export LD_LIBRARY_PATH='/opt/oracle/instantclient_11_2'
export NLS_LANG='AMERICAN_AMERICA.AL32UTF8'
export RAILS_ENV='test'

cd "$WORKSPACE"

cat > config/database.yml <<EOF
test:
  adapter: postgresql
  database: pricing_tool_test
  username: postgres
EOF

rvm use 2.1@pricing-tool
gem install bundler
bundle install

bundle exec rake db:drop || true
bundle exec rake db:create

cd frontend
npm install
bower install --config.interactive=false
gulp webdriverUpdate
cd ..

set +e

bundle exec rake lint
lint_status=$?

bundle exec rake spec
spec_status=$?

cd frontend
gulp unitTest
unitTest_status=$?

[ $lint_status -eq 0 -a $spec_status -eq 0 -a $unitTest_status -eq 0 ]
