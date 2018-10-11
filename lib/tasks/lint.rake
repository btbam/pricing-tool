#!/usr/bin/env rake

if Rails.env.test? || Rails.env.development?
  require 'rubocop/rake_task'
  require 'reek/rake/task'

  desc 'Run everything'
  task lint: ['lint:all']

  namespace :lint do
    task all: [:rubocop, :reek, :rbp]

    # RuboCop
    desc 'Run RuboCop'
    RuboCop::RakeTask.new(:rubocop) do |task|
      task.options = ['--config', "#{File.join(Rails.root, 'config', 'rubocop.yml')}"]
      task.fail_on_error = true
    end

    # Reek
    Reek::Rake::Task.new do |task|
      task.config_files = File.join(Rails.root, 'config', 'reek.yml')
      task.source_files = [
        'app/**/*.rb',
        'lib/**/*.rb',
        'lib/tasks/*.rake',
        'config/**/*.rb'
      ]
      task.fail_on_error = true
      # task.verbose = true
    end
    task :reek_msg do
      puts 'Running Reek...'
    end
    desc 'Run reek'
    task reek: :reek_msg

    # rails_best_practices
    desc 'Run rails_best_practices'
    task :rbp do
      puts 'Running Rails Best Practices...'
      puts

      options = {
        'exclude' => [
          /frontend/,
          /cookbooks/
        ]
      }
      analyzer = RailsBestPractices::Analyzer.new(Rails.root, options)
      analyzer.analyze
      analyzer.output
      fail if analyzer.runner.errors.size > 0
    end
    task rails_best_practices: :rbp
  end
end
