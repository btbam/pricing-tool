require 'rubygems'
require 'pp'
require 'benchmark'
require 'activerecord-import'

$stdout.sync = true

def task_list
  %w(comparables
     customers
     factors
     industry_averages
     industry_groups
     peer_groups
     policies)
end

namespace :import do
  namespace :csv do
    desc 'Import all CSVs'
    task all: [:environment] do
      task_list.each do |task|
        begin
          rake_task = Rake::Task["import:csv:#{task}"]
          puts "[#{rake_task.name}]"
          rake_task.invoke
        rescue => e
          puts "Import task failed: #{task}"
          puts e.message + "\n" + e.backtrace.join("\n")
        end
      end
    end

    desc 'Clear all imported data'
    task clear: [:environment] do
      task_list.each do |task|
        begin
          rake_task = Rake::Task["import:csv:#{task}:clear"]
          puts "[#{rake_task.name}]"
          rake_task.invoke
        rescue => e
          puts "Clear task failed: #{task}"
          puts e.message + "\n" + e.backtrace.join("\n")
        end
      end
    end
  end
end
