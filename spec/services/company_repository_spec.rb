require 'rails_helper'
require 'support/elastic_helper'

RSpec.describe CompanyRepository do
  context 'when indexed companies exist', elasticsearch: true do
    include_context 'indexed companies'

    describe '#find_by_duns' do
      it 'returns the company' do
        duns = company_data.sample[:index][:data][:duns_number]
        result = repo.find_by_duns(duns)
        expect(result).to be_a(Company)
        expect(result.duns_number).to eql(duns)
      end
    end

    describe '#find_by_name' do
      it 'returns the company' do
        name = company_data.sample[:index][:data][:name]
        result = repo.find_by_name(name)
        expect(result).to be_a(Company)
        expect(result.name).to eql(name)
      end
    end

    describe '#autocomplete_search' do
      it 'returns empty results for queries of less than 3 chars' do
        expect(repo.autocomplete_search('')).to be_empty
        expect(repo.autocomplete_search('a')).to be_empty
        expect(repo.autocomplete_search('ab')).to be_empty
      end

      it 'is consistent' do
        expected = repo.autocomplete_search('test', from: 0, size: 2).map(&:duns_number)
        actual = repo.autocomplete_search('test', from: 0, size: 2).map(&:duns_number)
        expect(actual).to eql(expected)
      end

      it 'paginates results' do
        first_page = repo.autocomplete_search('test', from: 0, size: 2).map(&:duns_number)
        second_page = repo.autocomplete_search('test', from: 2, size: 2).map(&:duns_number)

        expect(first_page.count).to eql(2)
        expect(second_page.count).to eql(2)
        expect(first_page - second_page).to eql(first_page)
      end
    end
  end

  context 'utility functions' do
    let(:repo) { CompanyRepository.new }

    describe '#field_score_script' do
      it 'returns nil when field is nil' do
        expect(repo.field_score_script(nil)).to be_nil
      end

      it 'returns nil when field does not exist' do
        expect(repo.field_score_script(:bad_field)).to be_nil
      end
    end

    describe '#script_score' do
      it 'calls default_score_script when option is a field that does not exist' do
        expect(repo).to receive(:default_score_script).once
        repo.script_score(:bad_option)
      end
    end

    describe '#numeric?' do
      it 'returns false for non-numeric values' do
        expect(repo.send(:numeric?, 'obviously non-numeric string')).to be_falsey
      end

      it 'returns truthy for numeric values' do
        expect(repo.send(:numeric?, 7.0)).to be_truthy
        expect(repo.send(:numeric?, 4_000_000_000)).to be_truthy
      end
    end
  end
end
