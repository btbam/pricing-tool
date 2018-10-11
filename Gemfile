source 'http://rubygems.org'

# Must be at top for ENV variables to flow down into other gems
gem 'dotenv-rails', groups: [:development, :test, :staging, :production] # MIT License

gem 'etl', git: 'git@dashboard:etl.git', tag: 'v1.0.0', require: false

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.4' # MIT License

# Postgres support
gem 'pg' # Ruby License

# OracleDB support
gem 'activerecord-oracle_enhanced-adapter', git: 'git@dashboard:oracle-enhanced.git', branch: 'v_1_5'
gem 'ruby-oci8', '~> 2.1.7' # BSD License

# Opinionated micro-framework for creating REST-like APIs in ruby
gem 'grape', '~> 0.12.0' # MIT License
gem 'grape-active_model_serializers' # MIT License
gem 'hashie-forbidden_attributes' # MIT License

# Ruby library to fetch and parse feeds as quickly as possible
gem 'feedjira' # MIT License
gem 'httparty' # MIT License

# Ruby gem to scrape metadata from urls
gem 'metainspector' # MIT License

# Flexible authentication solution for rails with warden
gem 'devise' # MIT License

# caching with memcached
gem 'dalli' # MIT-like license
gem 'connection_pool' # MIT License
gem 'api_cache' # MIT License
gem 'moneta' # MIT License

# Authorization
gem 'cancancan', '~> 1.9' # MIT License

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
gem 'bootstrap-sass', '~> 3.1.1' # MIT License
gem 'font-awesome-rails'         # MIT License

# D3
gem 'd3_rails' # MIT License

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer',  platforms: :ruby # MIT License

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Import Data en masse, do not automatically require- so we must manually load as needed
gem 'activerecord-import', '~> 0.4.0', require: false # Ruby License

# Elasticsearch rails integration
gem 'elasticsearch-rails'       # Apache2 License
gem 'elasticsearch-model'       # Apache2 License
gem 'elasticsearch-persistence' # Apache2 License
gem 'elasticsearch-extensions', # Apache2 License
    git: 'https://github.com/elasticsearch/elasticsearch-ruby.git',
    ref: 'fc904c20eadd801b8021004982e851ffcdff94e8'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7' # MIT License

# Angular
gem 'rails-assets-angular', source: 'https://rails-assets.org'        # MIT License
gem 'rails-assets-angular-route', source: 'https://rails-assets.org'  # MIT License

# Use debugger
# gem 'debugger', group: [:development, :test]

# Use unicorn as the app server
gem 'unicorn-rails' # MIT License

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw]

gem 'jwt' # MIT License

gem 'forgery' # dummy text for demos

gem 'faker'                             # MIT License

group :development, :test do
  gem 'awesome_print', require: 'ap'    # MIT License
  gem 'capistrano',  '~> 3.1'           # MIT License
  gem 'capistrano-rails', '~> 1.1'      # MIT License
  gem 'coffee-rails-source-maps'        # MIT License
  gem 'coffee-script-source', '= 1.6.1' # MIT License
  gem 'database_cleaner'
  gem 'factory_girl_rails'              # MIT License
  gem 'foreman'                         # MIT License
  gem 'hirb'                            # MIT License
  gem 'pry-byebug', git: 'https://github.com/deivid-rodriguez/pry-byebug.git' # MIT License
  gem 'pry-rails'                       # MIT License
  gem 'rails_best_practices'            # MIT License
  gem 'reek', git: 'https://github.com/troessner/reek', tag: 'v1.6.4' # MIT License
  gem 'rspec-rails'                     # MIT License
  gem 'shoulda-matchers'                # MIT License
  gem 'rubocop'                         # MIT License
  gem 'simplecov', require: false       # MIT License
  gem 'sqlite3'                         # MIT License
end

gem 'rack-cors', require: 'rack/cors' # MIT License

gem 'resque-scheduler', '~> 4.0.0'
gem 'resque_spec', group: :test

# gem for country and subregion lookup MIT License
gem 'carmen'
