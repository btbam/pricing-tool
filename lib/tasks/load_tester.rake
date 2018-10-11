require 'rubygems'
require 'pp'

$stdout.sync = true

URL = Rails.env.development? ? 'localhost:8080' : '127.0.0.1:7777'

namespace :load_test do
  desc 'Get a token for loadtesting'
  task :get_token, [:email, :password] => [:environment] do |_t, args|
    http = Curl.post("http://#{URL}/api/token",
                     'user[email]' => args.email,
                     'user[password]' => args.password)
    puts JSON.parse(http.body_str)['token']
  end

  desc 'Load-test the stack through unicorn. Can be run from anywhere.'
  task :unicorn_search, [:token] => [:environment] do |_t, args|
    lt = LoadTester.new
    lt.run do |_repo, names|
      http = Curl.get("http://#{URL}/api/entities/search", 'query' => names.sample) do |c|
        c.headers['Authorization: Bearer'] = args.token
      end
      puts http.body_str
    end
  end

  desc 'loadtest the stack through rails. Should be run on the production server.'
  task :rails_search, [:token] => [:environment] do # |t, args|
    lt = LoadTester.new
    lt.run do |repo, names|
      results = repo.autocomplete_search(names.sample)
      puts results.first.name
    end
  end

  desc 'Post to the API.'
  task :api_post, [:token] => [:environment] do |_t, args|
    http = Curl.get("http://#{URL}/api/entity/216123158/comparables") do |c|
      c.headers['Authorization: Bearer'] = args.token
    end
    puts http.body_str
  end
end
