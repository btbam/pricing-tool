require 'rails_helper'
require 'elasticsearch/extensions/test/cluster/tasks'

RSpec.configure do |config|
  config.before(:each, elasticsearch: true) do
    unless Elasticsearch::Extensions::Test::Cluster.running?
      Elasticsearch::Extensions::Test::Cluster.start(
        command: '/usr/share/elasticsearch/bin/elasticsearch',
        nodes: 1,
        es_params: "-D es.path.conf='#{Rails.root.join('config', 'elasticsearch', Rails.env)}'"
      )
    end
  end

  config.after(:suite) do
    Elasticsearch::Extensions::Test::Cluster.stop if Elasticsearch::Extensions::Test::Cluster.running?
  end
end

RSpec.shared_context 'indexed companies', elasticsearch: true do
  let!(:num_records) { 10 }
  let!(:index) { 'pricing_tool_test' }

  let!(:repo) do
    repo = CompanyRepository.new
    repo.index(index)
    repo
  end

  let!(:company_data) do
    data = []
    (1..num_records).each do |i|
      customer = i % 2 # every other company is an customer
      name = "Test #{Faker::Company.name}".upcase
      # longer names decrease relevance which helps to make sure sorting by customer is actually working
      name += ' CUSTOMER' if customer == 1

      street_address = Faker::Address.street_address
      city = Faker::Address.city
      state = Faker::Address.state_abbr
      zip_code = Faker::Address.zip_code

      ia = IndustryAverage.new
      ia.sic_code = Faker::Number.positive(1, 999).to_i

      data << {
        index: {
          data: {
            duns_number: Faker::Company.duns_number.tr('^0-9', '').to_i,
            name: name,
            sic_code: ia.sic_code,
            sic_code_first: ia.sic_first,
            city: city,
            state: state,
            zip_code: zip_code,
            street_address: street_address,
            full_address: "#{street_address} #{city}, #{state} #{zip_code}".upcase,
            sales_volume: Faker::Number.positive(1, 4_000_000_000),
            global_employee_total: Faker::Number.positive,
            customer: customer,
            tree_pos: Faker::Number.positive(1, 5).to_i,
            line_no: i
          }
        }
      }
    end
    data
  end

  before do
    company_data.each do |company|
      data = company[:index][:data]
      create(:company_info, data.except(:sic_code, :sic_code_first, :full_address, :line_no))
    end

    repo.delete_index! if Company.__elasticsearch__.client.indices.exists(index: index)
    repo.create_index!
    Company.__elasticsearch__.client.bulk(
      index: index,
      type: 'companies',
      body: company_data
    )
    5.times do
      break if repo.count == num_records
      sleep 1
    end
  end

  after do
    repo.delete_index! if Company.__elasticsearch__.client.indices.exists(index: index)
  end
end
