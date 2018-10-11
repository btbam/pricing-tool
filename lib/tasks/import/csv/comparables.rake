require 'rubygems'
require 'pp'
require 'carmen'
include Carmen

$stdout.sync = true

namespace :import do
  namespace :csv do
    namespace :comparables do
      desc 'Clear all Comparables data'
      task clear: [:environment] do
        Compare::Book.delete_all
        Compare::FinancialHealth.delete_all
        Compare::Industry.delete_all
        # Compare::NumberEmployeeCs.delete_all
        Compare::NumberEmployeeSm.delete_all
        # Compare::SalarySaleCs.delete_all
        Compare::SalarySaleSm.delete_all
        # Compare::CompanySizeSaleCs.delete_all
        Compare::CompanySizeSaleSm.delete_all
        Compare::StateSm.delete_all
        Compare::TaxState.delete_all
        Compare.delete_all
      end
    end

    desc 'Import all or certain comparables from CSVs. klasses is an array that can contain any class in the' \
         ' klass_to_files hash'
    task :comparables, [:klasses] => [:environment] do |_t, args|
      klass_to_files = { Compare::Book => '2015 0813 Book.csv',
                         Compare::FinancialHealth => '2015 0813 Financial Health.csv',
                         Compare::Industry => '2015 0813 Industry.csv',
                         # Compare::NumberEmployeeCs => '2015 0212 number of empl cs totempl.csv',
                         Compare::NumberEmployeeSm => '2015 0813 number of empl_sm_emptotl.csv',
                         # Compare::SalarySaleCs => 'comparables_salary_cs_sales_cs_totempl.csv',
                         Compare::SalarySaleSm => '2015 0212 salary_sm_sales_sm_emptotl.csv',
                         # Compare::CompanySizeSaleCs => 'comparables_size_of_comp_cs_sales.csv',
                         Compare::CompanySizeSaleSm => '2015 0813 size_of_comp_sm_sales.csv',
                         Compare::StateSm => '2015 0212 sm_state.csv',
                         Compare::TaxState => '2015 0813 Tax_state.csv'
                       }
      if args.klasses
        klass_to_files.select! do |klass|
          klass = klass.constantize if klass.respond_to?(:constantize)
          args.klasses.include?(klass.name)
        end
      end

      klass_to_files.each do |klass, filename|
        klass = klass.constantize if klass.respond_to?(:constantize)

        next unless klass.limit(1).empty?

        helper = ImporterHelper::CSV.new(filename: filename, skip_headers: true)

        rows = helper.import do |row, data|
          product = Business::Product.find_or_create_by name: row[0].upcase
          type = Business::Type.find_or_create_by name: row[1].upcase
          year = Business::Year.find_or_create_by name: row.last

          common_fields = [:id, :compare_id, :created_at, :updated_at, :range_low, :range_high]
          poly_fields = klass.column_names.reject { |name| common_fields.include?(name.to_sym) }
          compare_fields_start = 2 + poly_fields.size
          attrs = Hash[poly_fields.zip(row[2...compare_fields_start])]
          compare_type = klass.new attrs

          compare = Compare.create(business_product: product,
                                   business_type: type,
                                   num_policies: row[compare_fields_start],
                                   num_policies_with_claims: row[compare_fields_start += 1],
                                   num_policies_with_positive_claims: row[compare_fields_start += 1],
                                   num_of_claims: row[compare_fields_start += 1],
                                   num_of_claims_with_positive_payment: row[compare_fields_start += 1],
                                   loss_ratio: row[compare_fields_start + 1],
                                   business_year: year,
                                   compare_type: compare_type
                                  )
          compare_type.update_attributes compare_id: compare.id
          data << nil
        end
        puts "inserting #{rows.size} rows for #{klass}"
      end

      [Compare::NumberEmployeeSm, Compare::SalarySaleSm, Compare::CompanySizeSaleSm].each do |klass|
        klass.all.each do |record|
          range = RangeFromText.new(record.range)
          record.range_low = range.low
          record.range_high = range.high
          record.save
        end
        book_combinations = Business::Product.where("name != ' '").count * Business::Type.where("name != ' '").count
        highest_ranges = klass.order(range_high: :desc)
        highest_ranges[0...book_combinations].each do |highest_range|
          highest_range.range = ImporterHelper::CSV.max_range_string(highest_range.range)
          highest_range.save
        end
      end

      country = Country.named('United States')
      state_sm = Compare::StateSm.all
      update_state(state_sm, country)

      tax_state = Compare::TaxState.all
      update_state(tax_state, country)
    end

    def self.update_state(data, country)
      data.each do |row|
        state_code = row[:state].strip
        state = country.subregions.coded(state_code)
        if state
          row[:state] = state.name
          row.save
        end
      end
    end
  end
end
