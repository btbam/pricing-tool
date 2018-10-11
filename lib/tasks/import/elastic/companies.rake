require 'rubygems'
require 'pp'
require 'benchmark'
require 'activerecord-import'

$stdout.sync = true

# increase the timeout for imports
configure_client = proc do
  client = Elasticsearch::Client.new(
    url: ENV['ES_URL'],
    transport_options: {
      request: { timeout: 30 }
    }
  )
  Elasticsearch::Model.client = client
  Elasticsearch::Persistence.client = client
end

namespace :import do
  namespace :elastic do
    namespace :companies do
      desc 'Drop the Elasticsearch companies index and recreate it'
      task reset: [:environment] do
        configure_client.call

        repo = CompanyRepository.new
        repo.delete_index! if Company.__elasticsearch__.client.indices.exists(index: 'pricing_tool_' + Rails.env)
        repo.create_index!
      end

      desc 'Import small companies from dnb_company_addresses.csv directly into Elasticsearch'
      task :small, [:update] => [:environment] do |_t, args|
        configure_client.call
        helper = ImporterHelper::CSV.new(filename: 'dnb_company_addresses_adjusted.csv')
        if args.update
          repo = CompanyRepository.new
          if repo.count > 0
            line_no = repo.search('sort' => { 'small_line_no' => 'desc' }).first.try(:small_line_no).to_i
          else
            line_no = nil
          end
        end
        ia = IndustryAverage.new

        helper.import do |row, data, i, file|
          next data if args.update && line_no && i <= line_no

          geo_code = row[6].to_s.strip[0..2]
          is_public = row[13].to_i
          next data if geo_code != '000' || is_public == 1

          ia.sic_code = row[8].to_i
          street_address = row[2].to_s.strip
          city = row[3].to_s.strip
          state = row[4].to_s.strip
          zip_code = row[5].to_s.strip
          zip_code5 = zip_code[0..4] if CompanyRepository.numeric?(zip_code)

          data << { index: { data: { duns_number: row[0].to_i,
                                     name: row[1].to_s.strip,
                                     sic_code: ia.sic_code,
                                     sic_code_first: ia.sic_first,
                                     city: city,
                                     state: state,
                                     zip_code: zip_code,
                                     zip_code5: zip_code5,
                                     street_address: street_address,
                                     full_address: "#{street_address} #{city}, #{state} #{zip_code}",
                                     sales_volume: helper.if_nil(row[9]) { row[9].to_i },
                                     global_employee_total: helper.if_nil(row[10]) { row[10].to_i },
                                     customer: row[12].to_i,
                                     tree_pos: row[11].to_i,
                                     small_line_no: i
                                   } } }

          if i % 5000 == 0 || file.eof?
            puts "inserting duns #{row[0]} : at: #{i}"
            Company.__elasticsearch__.client.bulk(
              index: ENV['ES_INDEX'],
              type: 'companies',
              body: data
            )

            []
          else
            data
          end
        end
      end

      desc 'Import companies from dnb_company_addresses_adjusted2.csv directly to Elasticsearch.'
      task :large, [:update] => [:environment] do |_t, args|
        configure_client.call
        helper = ImporterHelper::CSV.new(filename: 'dnb_company_addresses_adjusted2.csv', skip_headers: true)
        if args.update
          repo = CompanyRepository.new
          if repo.count > 0
            line_no = repo.search('sort' => { 'large_line_no' => 'desc' }).first.try(:large_line_no).to_i
          else
            line_no = nil
          end
        end
        ia = IndustryAverage.new

        helper.import do |row, data, i, file|
          next data if args.update && line_no && i <= line_no

          country_code = row[1].to_s.strip
          is_public = row[33].to_i
          next data if country_code != '000' || is_public == 1

          ia.sic_code = row[14].to_i
          street_address = row[24].to_s.strip
          city = row[26].to_s.strip
          state = row[5].to_s.strip
          zip_code = row[6].to_s.strip
          zip_code5 = zip_code[0..4] if CompanyRepository.numeric?(zip_code)

          data << { index: { data: { duns_number: row[0].to_i,
                                     name: row[4].to_s.strip,
                                     sic_code: ia.sic_code,
                                     sic_code_first: ia.sic_first,
                                     city: city,
                                     state: state,
                                     zip_code: zip_code,
                                     zip_code5: zip_code5,
                                     street_address: street_address,
                                     full_address: "#{street_address} #{city}, #{state} #{zip_code}",
                                     sales_volume: helper.if_nil(row[8]) { row[8].to_i },
                                     global_employee_total: helper.if_nil(row[10]) { row[10].to_i },
                                     customer: row[32].to_i,
                                     tree_pos: row[13].to_i,
                                     large_line_no: i
                                   } } }

          if i % 5000 == 0 || file.eof?
            puts "inserting duns #{row[0]} : at: #{i}"
            Company.__elasticsearch__.client.bulk(
              index: ENV['ES_INDEX'],
              type: 'companies',
              body: data
            )

            []
          else
            data
          end
        end
      end
    end
  end
end
