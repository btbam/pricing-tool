require 'rubygems'
require 'pp'
require 'benchmark'
require 'activerecord-import'

$stdout.sync = true

namespace :import do
  namespace :csv do
    namespace :customers do
      desc 'Clear all Customer data'
      task clear: [:environment] do
        Customer.delete_all
      end
    end

    desc 'Import Customer data'
    task customers: [:environment] do
      fail 'customers table not empty' unless Customer.limit(1).first.nil?

      filename = 'customer_table.csv'
      helper = ImporterHelper::CSV.new(filename: filename, skip_headers: true)
      columns = [:product, :policy_type, :duns_number, :insured_name, :policy_year]

      rows = helper.import do |row, data|
        data << row
      end

      puts "inserting #{rows.size} rows for Customer"
      Customer.import columns, rows, validate: false
    end
  end
end
