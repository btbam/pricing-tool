require 'rubygems'
require 'pp'
require 'benchmark'
require 'activerecord-import'

$stdout.sync = true

namespace :export do
  namespace :companies do
    desc 'Export companies from dnb_company_addresses2.csv to dnb_company_addresses_adjusted2.csv.'
    task :csv, [:update] => [:environment] do # |t, args|
      CSV.open('dnb_company_addresses_adjusted2.csv', 'w') do |csv|
        helper = ImporterHelper::CSV.new(filename: 'dnb_company_addresses2.csv', data: csv)
        helper.import do |row, data|
          c = Customer.find_by_duns row[0].to_i
          row << (c.nil? ? 0 : 1)
          data << row
        end
      end
    end

    desc 'Slower export and should not be used.  Keeping the task here for field references in the future.'
    task :csv_range, [:range] => [:environment] do # |_t, args|
      CSV.open('./dnb_company_addresses_adjusted.csv', 'w') do |csv|
        helper = ImporterHelper::CSV.new(filename: './dnb_company_addresses.csv',
                                         data: csv)
        helper.import do |row, data, _i|
          customer = Customer.find_by_duns row[0].to_i
          csad = OracleCsad.find_by_duns(row[0].to_i)
          smad = OracleSmad.find_by_duns(row[0].to_i)

          row << helper.find_decimal(csad, smad, :sales, :sales)
          row << helper.find_decimal(csad, smad, :totempl, :emptotl)
          row << helper.find_loc_ind(csad, smad)
          row << (customer.nil? ? 0 : 1)

          data << row
        end
      end
    end

    desc 'This is a faster export than csv_range.  Keeping both for quick documentation.'
    task :csv_pubpvt, [:range] => [:environment] do # |_t, args|
      CSV.open('./dnb_company_addresses_adjusted2_100K_adjusted.csv', 'w') do |w_csv|
        r_csv = CSV.open('./dnb_company_addresses_adjusted2_100K.csv', 'r:ISO-8859-15:UTF-8')
        total_elapsed_time = Benchmark.realtime do
          data = []
          r_csv.each_with_index do |row, i|
            data << row
            next if (i % 999 != 0 || i == 0) && !r_csv.eof?

            puts "data size: #{data.size}"

            time = Benchmark.realtime do
              data = data.sort_by { |elem| elem[0] }
            end
            puts "sorted time: #{time}s"

            duns_numbers = nil
            time = Benchmark.realtime do
              duns_numbers = data.map(&:first)
            end
            puts "map time: #{time}s"

            pubpvts = nil
            time = Benchmark.realtime do
              pubpvts = OracleCsad.select(:duns_number, :pubpvt).joins(
                                    'inner join (' + OracleCsad.select('duns_number, max(as_of_dt) as max_date')
                                                               .where(duns_number: duns_numbers)
                                                               .group(:duns_number)
                                                               .to_sql +
                                    ') OC on ("L_ADM_LND"."LND_T_DNB_CSAD"."DUNS_NUMBER" = OC.duns_number and
                                              "L_ADM_LND"."LND_T_DNB_CSAD"."AS_OF_DT" = OC.max_date)')
            end
            puts "query time: #{time}s"

            time = Benchmark.realtime do
              p_count = 0
              d_count = 0
              puts "pubpvts.size = #{pubpvts.size}"
              duns_numbers.each_with_index do |duns_number, _dn_i|
                d_row = data.detect { |da_row| da_row[0].to_i == duns_number.to_i }
                p_row = pubpvts.detect { |pu_row| pu_row.duns_number.to_i == duns_number.to_i }
                if p_row
                  p_count += 1
                  is_public = p_row.pubpvt && p_row.pubpvt.downcase.strip == 's' ? 1 : 0
                  d_row << is_public
                end
                d_count += 1
                w_csv << d_row
              end
              puts "p_count = #{p_count}"
              puts "d_count = #{d_count}"
              data = []
            end
            puts "write time: #{time}s\n\n\n"
          end
        end
        puts "total time: #{total_elapsed_time}s"
      end
    end
  end
end
