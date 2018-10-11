require 'rubygems'
require 'pp'

$stdout.sync = true

namespace :import do
  namespace :csv do
    desc 'Import all Factors data'
    task factors: ['factors:industry', 'factors:financial']

    namespace :factors do
      desc 'Clear all Calculator data'
      task clear: [:environment] do
        Calculator::FinancialFactor.delete_all
        Calculator::IndustryFactor.delete_all
      end

      desc 'Import Industry Factor data for the Calculator'
      task industry: [:environment] do
        filename = 'industry_factor.csv'
        helper = ImporterHelper::CSV.new(filename: filename, skip_headers: true)

        columns = [:sic_code, :name, :factor, :business_product_id, :business_type_id, :ca]

        rows = helper.import do |row, data|
          product = Business::Product.find_by_name(row[3].upcase)
          type = Business::Type.find_by_name(row[4].upcase == 'PVT' ? 'PRIVATE' : 'NFP')
          ca_flag = row[5] == '1'

          data << [
            row[0],     # :sic_code
            row[1],     # :name
            row[2],     # :factor
            product.id, # :business_product_id
            type.id,    # :business_type_id
            ca_flag
          ]
        end

        puts "inserting #{rows.size} rows for Calculator::IndustryFactor"
        Calculator::IndustryFactor.import columns, rows
      end

      desc 'Import financial condition factors'
      task financial: [:environment] do
        filename = 'financial_condition_factor.csv'
        helper = ImporterHelper::CSV.new(filename: filename, skip_headers: true)

        columns = [:dnb_financial_distress_score, :relativity_factor, :business_product_id, :business_type_id]

        rows = helper.import do |row, data|
          product = Business::Product.find_by_name(row[2].upcase)
          type = Business::Type.find_by_name(row[3].upcase == 'PVT' ? 'PRIVATE' : 'NFP')

          data << [
            row[0],     # :dnb_financial_distress_score
            row[1],     # :relativity_factor
            product.id, # :business_product_id
            type.id     # :business_type_id
          ]
        end

        puts "inserting #{rows.size} rows for Calculator::FinancialFactor"
        Calculator::FinancialFactor.import columns, rows
      end
    end
  end
end
