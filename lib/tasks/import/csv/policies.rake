require 'rubygems'
require 'pp'

$stdout.sync = true

# TODO: :reek:UtilityFunction
def parse_scientific(num)
  num.to_f.to_i
end

namespace :import do
  namespace :csv do
    task policies: %w(policies:epli policies:dno)

    namespace :policies do
      desc 'Clear all Policy data'
      task clear: [:environment] do
        Policy.delete_all
      end

      desc 'Import all Private EPLI Policy data'
      task epli: [:environment] do
        filename = '20150624_Private_EPLI_07_14.csv'
        helper = ImporterHelper::CSV.new(filename: filename, skip_headers: true)

        columns = [:policy_number, :limit, :retention, :sales, :gwp, :loss_severity, :tax_state_code,
                   :tax_state_abbr, :sic_code, :sic_00_code, :duns_number, :business_product_id,
                   :business_type_id, :policy_year, :employee_count]

        rows = helper.import do |row, data|
          product = Business::Product.find_by_name('EPLI')
          type = Business::Type.find_by_name('PRIVATE')

          new_row = [
            row[1],     # :policy_number
            parse_scientific(row[10]),    # :limit
            parse_scientific(row[11]),    # :retention
            parse_scientific(row[12]),    # :sales
            parse_scientific(row[15]),    # :gwp
            row[16],    # :loss_severity
            row[17],    # :tax_state_code
            row[18],    # :tax_state_abbr
            row[5],     # :sic_code
            row[6],     # :sic_00_code
            row[3],     # :duns_number
            product.id, # :business_product_id
            type.id,    # :business_type_id
            row[2],     # :policy_year
            parse_scientific(row[13])     # :employee_total
          ]

          data << new_row
        end

        puts "inserting #{rows.size} rows for Policy (EPLI)"
        Policy.import columns, rows, validate: false
      end

      desc 'Import all Private D&O Policy data'
      task dno: [:environment] do
        filename = '20150624_Private_DO_07_14.csv'
        helper = ImporterHelper::CSV.new(filename: filename, skip_headers: true)

        columns = [:policy_number, :limit, :retention, :sales, :gwp, :loss_severity, :sic_code, :sic_00_code,
                   :duns_number, :business_product_id, :business_type_id, :policy_year, :employee_count]

        rows = helper.import do |row, data|
          product = Business::Product.find_by_name('DO')
          type = Business::Type.find_by_name('PRIVATE')

          new_row = [
            row[1],     # :policy_number
            parse_scientific(row[10]),    # :limit
            parse_scientific(row[11]),    # :retention
            parse_scientific(row[12]),    # :sales
            parse_scientific(row[15]),    # :gwp
            row[16],    # :loss_severity
            row[5],     # :sic_code
            row[6],     # :sic_00_code
            row[3],     # :duns_number
            product.id, # :business_product_id
            type.id,    # :business_type_id
            row[2],     # :policy_year
            parse_scientific(row[13])     # :employee_total
          ]

          data << new_row
        end

        puts "inserting #{rows.size} rows for Policy (D&O)"
        Policy.import columns, rows, validate: false
      end
    end
  end
end
