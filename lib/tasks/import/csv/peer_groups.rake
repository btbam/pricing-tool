require 'rubygems'
require 'pp'
require 'benchmark'
require 'activerecord-import'

namespace :import do
  namespace :csv do
    task peer_groups: %w(peer_groups:epli peer_groups:dno)

    namespace :peer_groups do
      desc 'Clear all Peer Group data'
      task clear: [:environment] do
        EpliGroup.delete_all
        DnoGroup.delete_all
      end

      desc 'Import EPLI peer groups'
      task epli: [:environment] do
        filename = '20150623_pricing-tool_EPLI_Group.csv'
        helper = ImporterHelper::CSV.new(filename: filename, skip_headers: true)

        columns = [:gp_index, :industry_groups, :state_groups, :min_empl, :max_empl, :npol, :gwp_sum, :pred_loss_sum,
                   :actual_loss_sum, :pred_gross_sum, :actual_gross_sum, :max_loss, :actual_rt, :pred_rt,
                   :actual_lr, :pred_lr, :cap_rt_need, :cap_rate_gwp, :group_code]
        business_product_id = Business::Product.find_by(name: 'EPLI').id
        business_type_id = Business::Type.find_by(name: 'PRIVATE').id

        rows = helper.import do |row, data|
          row << IndustryGroup.where(industry: row[1],
                                     business_product_id: business_product_id,
                                     business_type_id: business_type_id).first.group_code
          data << row
        end

        puts "inserting #{rows.size} rows for EpliGroup"
        EpliGroup.import columns, rows
      end

      desc 'Import D&O peer groups'
      task dno: [:environment] do
        filename = '20150623_pricing-tool_Group.csv'
        helper = ImporterHelper::CSV.new(filename: filename, skip_headers: true)

        columns = [:gp_index, :industry_groups, :min_sales, :max_sales, :min_f, :max_f, :npol, :gwp_sum,
                   :pred_loss_sum, :actual_loss_sum, :pred_gross_sum, :actual_gross_sum, :max_loss, :actual_rt,
                   :pred_rt, :actual_lr, :pred_lr, :cap_rt_need, :cap_rate_gwp, :group_code]
        business_product_id = Business::Product.find_by(name: 'DO').id
        business_type_id = Business::Type.find_by(name: 'PRIVATE').id

        rows = helper.import do |row, data|
          row << IndustryGroup.where(industry: row[1],
                                     business_product_id: business_product_id,
                                     business_type_id: business_type_id).first.group_code
          data << row
        end

        puts "inserting #{rows.size} rows for DnoGroup"
        DnoGroup.import columns, rows
      end
    end
  end
end
