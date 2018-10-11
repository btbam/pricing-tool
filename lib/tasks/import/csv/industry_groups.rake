require 'rubygems'
require 'pp'
require 'benchmark'
require 'activerecord-import'

namespace :import do
  namespace :csv do
    task industry_groups: %w(industry_groups:epli industry_groups:dno)

    namespace :industry_groups do
      desc 'Clear all Industry Group data'
      task clear: [:environment] do
        IndustryGroup.delete_all
      end

      desc 'Import EPLI industry groups'
      task epli: [:environment] do
        filename = '20150623_pricing-tool_EPLI_Group_SIC_Codes.csv'
        helper = ImporterHelper::CSV.new(filename: filename, skip_headers: true)

        columns = [:sic_code, :industry, :group_code, :business_product_id, :business_type_id]

        group_code = 0
        current_industry = ''
        business_product_id = Business::Product.find_by(name: 'EPLI').id

        rows = helper.import do |row, data|
          if row[2] != current_industry
            current_industry = row[2]
            group_code += 1
          end
          business_type_id = Business::Type.find_by(name: row[0].split(' ')[0].upcase).id

          new_row = [
            row[1],
            row[2],
            group_code,
            business_product_id,
            business_type_id
          ]
          data << new_row
        end

        puts "inserting #{rows.size} rows for IndustryGroup (EPLI)"
        IndustryGroup.import columns, rows
      end

      desc 'Import D&O industry groups'
      task dno: [:environment] do
        filename = '20150623_pricing-tool_Group_SIC_Codes.csv'
        helper = ImporterHelper::CSV.new(filename: filename, skip_headers: true)

        columns = [:sic_code, :industry, :group_code, :business_product_id, :business_type_id]

        group_code = 0
        current_industry = ''
        business_product_id = Business::Product.find_by(name: 'DO').id

        rows = helper.import do |row, data|
          if row[2] != current_industry
            current_industry = row[2]
            group_code += 1
          end
          business_type_id = Business::Type.find_by(name: row[0].split(' ')[0].upcase).id

          new_row = [
            row[1],
            row[2],
            group_code,
            business_product_id,
            business_type_id
          ]
          data << new_row
        end

        puts "inserting #{rows.size} rows for IndustryGroup (D&O)"
        IndustryGroup.import columns, rows
      end
    end
  end
end
