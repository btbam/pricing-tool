require 'rubygems'
require 'pp'
require 'benchmark'
require 'activerecord-import'

$stdout.sync = true

namespace :import do
  namespace :csv do
    namespace :industry_averages do
      desc 'Clear all Industry Averages data'
      task clear: [:environment] do
        IndustryAverage.delete_all
      end
    end

    desc 'Import Industry Averages data'
    task industry_averages: [:environment] do
      fail 'industry_averages table not empty' unless IndustryAverage.limit(1).first.nil?

      filename = 'industry_avg_table.csv'
      helper = ImporterHelper::CSV.new(filename: filename, skip_headers: true)
      columns = [:category, :sic_code, :sic_description, :num_policies,
                 :avg_employees, :avg_revenue, :avg_financial_stress,
                 :avg_year_started, :median_employees, :median_revenue,
                 :median_financial_stress, :median_year_started]

      rows = helper.import do |row, data|
        row[2] = row[2].gsub(/(,|;)/, '') if row[2]
        data << row
      end

      puts "inserting #{rows.size} rows for IndustryAverage"
      IndustryAverage.import columns, rows, validate: false
    end
  end
end
