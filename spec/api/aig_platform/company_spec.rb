require 'support/api_helper'
require 'support/elastic_helper'
require 'support/resque_helper'

RSpec.describe Platform::Company do
  describe 'GET /api/entities/search' do
    it 'requires authentication' do
      get '/api/entities/search'
      expect(last_response.status).to eql(401)
    end

    context 'when logged in with privileges' do
      include_context 'logged in with privileges'
      include_context 'indexed companies'

      it 'returns autocomplete results from elasticsearch', elasticsearch: true do
        get '/api/entities/search', query: company_data.sample[:index][:data][:name]
        expect(last_response.status).to eql(200)
        response = JSON.parse(last_response.body)
        expect(response).to have_key('companies')
        expect(response['companies']).to be_an(Array)
        expect(response['companies']).not_to be_empty
      end

      it 'returns an empty array of companies when missing a query' do
        get '/api/entities/search'
        expect(last_response.status).to eql(200)
        response = JSON.parse(last_response.body)
        expect(response).to have_key('companies')
        expect(response['companies']).to be_an(Array)
        expect(response['companies']).to be_empty
      end
    end

    context 'when logged in without privileges' do
      include_context 'logged in without privileges'
      it 'returns an empty array of companies' do
        get '/api/entities/search', query: 'some company'
        expect(last_response.status).to eql(200)
        response = JSON.parse(last_response.body)
        expect(response).to have_key('companies')
        expect(response['companies']).to be_empty
      end
    end
  end

  describe 'GET /api/entities/search/all' do
    context 'when logged in with privileges' do
      include_context 'logged in with privileges'
      include_context 'indexed companies'

      it 'pulls info from elastic search', elasticsearch: true do
        get '/api/entities/search/all', query: company_data.sample[:index][:data][:name]
        expect(last_response.status).to eql(200)
        response = JSON.parse(last_response.body)
        expect(response).to have_key('companies')
        expect(response['companies']).to be_an(Array)
        expect(response['companies']).not_to be_empty
      end

      it 'returns an empty array of companies when missing a query' do
        get '/api/entities/search/all'
        expect(last_response.status).to eql(200)
        response = JSON.parse(last_response.body)
        expect(response).to have_key('companies')
        expect(response['companies']).to be_an(Array)
        expect(response['companies']).to be_empty
      end

      it 'accepts from and size params', elasticsearch: true do
        get '/api/entities/search/all', query: 'Test', from: 4, size: 2
        expect(last_response.status).to eql(200)
        response = JSON.parse(last_response.body)
        expect(response).to have_key('companies')
        expect(response['companies']).to be_an(Array)
        expect(response['companies'].count).to eql(2)
      end

      it 'sorts customers first by default', elasticsearch: true do
        get '/api/entities/search/all', query: 'Test', from: 0, size: 1
        expect(last_response.status).to eql(200)
        response = JSON.parse(last_response.body)
        expect(response).to have_key('companies')
        expect(response['companies']).to be_an(Array)
        expect(response['companies'][0]['customer']).to eql(true)
      end

      it 'can disable sorting customers first', elasticsearch: true do
        get '/api/entities/search/all', query: 'Test', from: 0, size: 10, customer: 0
        expect(last_response.status).to eql(200)
        response = JSON.parse(last_response.body)
        expect(response).to have_key('companies')
        expect(response['companies']).to be_an(Array)

        # one of the first 5 not a customer implies sort is disabled
        # TODO: this test is not entirely deterministic
        found = false
        response['companies'][0..4].each do |company|
          break if found = company['customer'] == false # rubocop:disable AssignmentInCondition
        end
        expect(found).to eql(true)
      end
    end

    context 'when logged in without privileges' do
      let!(:example_company) do
        build(:company_info)
      end

      before do
        allow(CompanyInfo).to receive(:create_from_es).and_return(example_company)
        allow_any_instance_of(CompanyInfo).to receive(:industry_average).and_return(nil)
        allow_any_instance_of(CompanyRepository).to receive(:autocomplete_search).and_return([example_company])
      end

      include_context 'logged in without privileges'
      it 'returns an empty array of companies' do
        get '/api/entities/search/all', query: 'some company'
        expect(last_response.status).to eql(200)
        response = JSON.parse(last_response.body)
        expect(response).to have_key('companies')
        expect(response['companies']).to be_empty
      end
    end
  end

  describe 'GET /api/entity/:duns_number/peer_policies' do
    let!(:example_company) do
      build(:company_info)
    end
    let!(:company_policy) { create(:policy, duns_number: example_company.duns_number) }

    before do
      allow(DatabaseFallback::PgOracle).to receive(:fallback_if_necessary).and_return(nil)
      allow(CompanyInfo).to receive(:create_from_es).and_return(example_company)
      allow(example_company).to receive(:current_dno_policy).and_return(company_policy)
      allow(example_company).to receive(:current_epli_policy).and_return(company_policy)
    end

    context 'when logged in with privileges' do
      include_context 'logged in with privileges'
      context 'when the duns_number exists' do
        let!(:example_company) do
          build(:company_info)
        end
        let!(:dno) { create(:business_product, name: 'DO') }
        let!(:epli) { create(:business_product, name: 'EPLI') }
        let!(:private) { create(:business_type, name: 'PRIVATE') }

        it 'returns peer policy information for a company' do
          allow_any_instance_of(EpliPeerGroupApi).to receive(:peer_group).and_return(nil)
          allow_any_instance_of(DnoPeerGroupApi).to receive(:peer_group).and_return(nil)
          allow_any_instance_of(CompanyRepository).to receive(:find_by_duns_array).and_return([])
          allow_any_instance_of(CompanyRepository).to receive(:find_by_duns).and_return(example_company)
          get "/api/entity/#{example_company.duns_number}/peer_policies"
          expect(last_response.status).to eql(200)
          response = JSON.parse(last_response.body)
          expect(response['peer_policies']).to_not be_nil
          expect(response['peer_policies']['dno_policies']).to_not be_nil
          expect(response['peer_policies']['epli_policies']).to_not be_nil
        end
      end
    end
  end

  describe 'GET /api/entity/:duns_number/calculator' do
    let!(:example_company) do
      build(:company_info)
    end

    before do
      allow(DatabaseFallback::PgOracle).to receive(:fallback_if_necessary).and_return(nil)
      allow(CompanyInfo).to receive(:create_from_es).and_return(example_company)
    end

    context 'when logged in with privileges' do
      include_context 'logged in with privileges'

      context 'when the duns_number exists' do
        it 'returns calculator information for a company' do
          get "/api/entity/#{example_company.duns_number}/calculator?sic_code=79"
          expect(last_response.status).to eql(200)
          response = JSON.parse(last_response.body)
          expect(response['financial_institution']).to_not be_nil
          expect(response['assets']).to_not be_nil
          expect(response['retention']).to_not be_nil
          expect(response['limit']).to_not be_nil
          expect(response['dno_factors']).to_not be_nil
          expect(response['epli_factors']).to_not be_nil
          expect(response['years_in_operation']).to be_nil
        end
      end
    end
  end

  describe 'GET /api/entity/:duns_number' do
    let!(:example_company) do
      build(:company_info)
    end

    before do
      allow(DatabaseFallback::PgOracle).to receive(:fallback_if_necessary).and_return(nil)
      allow(CompanyInfo).to receive(:create_from_es).and_return(example_company)
      allow_any_instance_of(CompanyInfo).to receive(:industry_average).and_return(nil)
      allow_any_instance_of(CompanyInfo).to receive(:set_real_data)
      allow_any_instance_of(CompanyInfo).to receive(:missing_description).and_return('missing description')
    end

    shared_examples 'company missing data' do
      # it 'returns the default company information' do
      #   get "/api/entity/#{example_company.duns_number}"
      #   expect(last_response.status).to eql(200)
      #   response = JSON.parse(last_response.body)
      #   expect(response).to have_key('company')
      #   expect(response['company']).to be_a(Hash)
      #   expect(response['company']['description']).to eql('missing description')
      # end
    end

    context 'when logged in with privileges' do
      include_context 'logged in with privileges'

      context 'when the duns_number exists' do
        it 'returns information for a company' do
          get "/api/entity/#{example_company.duns_number}"
          expect(last_response.status).to eql(200)
          response = JSON.parse(last_response.body)
          expect(response).to have_key('company')
          expect(response['company']).to be_a(Hash)
          expect(response['company']['duns_number']).to eql(example_company.duns_number)
          expect(UserHistory.find_by_user_and_duns(valid_user.id, example_company.duns_number)).to_not be_nil
        end

        it 'catches and returns error messages' do
          allow_any_instance_of(CompanyInfo).to receive(:set_real_data).and_raise('example error')

          get "/api/entity/#{example_company.duns_number}"
          expect(last_response.status).to eql(500)
          response = JSON.parse(last_response.body)
          expect(response).to have_key('error')
          expect(response['error']).to eql('example error')
        end
      end

      context 'when the duns_number cannot be found' do
        before do
          allow(CompanyInfo).to receive(:create_from_es).and_return(nil)
        end
        it_behaves_like 'company missing data'
      end
    end

    context 'when logged in without privileges' do
      include_context 'logged in without privileges'
      it_behaves_like 'company missing data'
    end
  end

  describe 'GET /api/news/search' do
    let!(:example_company) { build(:company_info) }
    let!(:example_query) { "#{example_company.name} test search" }

    before do
      allow(Rails.configuration.pricing-tool).to receive(:news_demo).and_return(true)
      allow(CompanyInfo).to receive(:create_from_es).and_return(example_company)
      allow_any_instance_of(CompanyInfo).to receive(:industry_average).and_return(nil)
      allow_any_instance_of(CompanyInfo).to receive(:set_real_data)
      allow_any_instance_of(CompanyInfo).to receive(:missing_description).and_return('missing description')
    end

    context 'when logged in with privileges' do
      include_context 'logged in with privileges'

      let!(:sample_article) { { 'title' => 'Sample News Article', 'url' => 'http://sample.example.com' } }
      let!(:google_api) { instance_double('ApiParser::GoogleJSON') }

      before do
        allow(ApiParser::GoogleJSON).to receive(:fetch_and_parse).and_return(google_api)
        allow(google_api).to receive(:entries).and_return([sample_article])
        allow(google_api).to receive(:results_total).and_return(1)
        allow(google_api).to receive(:results_time).and_return(0.12345)
        allow(google_api).to receive(:pages_total).and_return(1)
      end

      it 'returns results from the Google Search API' do
        get '/api/news/search', q: example_query
        response = JSON.parse(last_response.body)
        expect(response['results']).to contain_exactly(sample_article)
      end

      it 'returns results' do
        get '/api/news/search', q: example_query
        expect(last_response.status).to eql(200)
        response = JSON.parse(last_response.body)
        expect(response.keys).to include('results')
        expect(response['results']).to be_an(Array)
      end

      it 'returns stats' do
        get '/api/news/search', q: example_query
        expect(last_response.status).to eql(200)
        response = JSON.parse(last_response.body)
        expect(response.keys).to include('stats')
        expect(response['stats']).to include('time', 'total', 'pages')
      end
    end
  end
end
