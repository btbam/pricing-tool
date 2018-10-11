require 'rails_helper'

RSpec.describe IndustryAverage do
  describe '#company_infos' do
    let!(:info1) { create(:company_info) }
    let!(:old_info1) { create(:company_info, duns_number: info1.duns_number, as_of_date: 1.year.ago) }
    let!(:info2) { create(:company_info) }
    let(:industry_average) { build(:industry_average) }
    let(:es_company) { Company.new(sic_code_first: industry_average.sic_code, duns_number: info1.duns_number) }

    # Due to clever metaprogramming somewhere, CompanyRepository#search isn't defined until we've actually initialized a
    # CompanyRepository object, and rspec won't let us stub it otherwise.
    before do
      repo = CompanyRepository.new
      allow(CompanyRepository).to receive(:new).and_return(repo)
      allow(repo).to receive(:search).and_return([es_company])
    end

    it 'finds company infos for this industry average' do
      expect(industry_average.company_infos).to include(info1)
      expect(industry_average.company_infos).to include(old_info1)
      expect(industry_average.company_infos).not_to include(info2)
    end
  end

  describe '#by_category' do
    let!(:industry_average) { FactoryGirl.create(:industry_average, category: 'TYPE_PRODUCT') }

    it 'returns IndustryAverage by category' do
      expect(IndustryAverage.by_category('product', 'type')).to eq [industry_average]
    end
  end

  describe '#self.find_by_industry_code_and_category' do
    let!(:industry_average) { FactoryGirl.create(:industry_average, category: 'TYPE_PRODUCT', sic_code: '98') }

    it 'finds by industry code and category' do
      code_and_category = IndustryAverage.find_by_industry_code_and_category(industry_average.sic_code,
                                                                             'PRODUCT',
                                                                             'TYPE')
      expect(code_and_category).to eq [industry_average]
    end
  end

  describe '#self.generate_category_name' do
    it 'generates the category name with private' do
      expect(IndustryAverage.generate_category_name('PrOd', 'PrIvAtE')).to eq 'Private_PROD'
    end

    it 'generates the category name with private' do
      expect(IndustryAverage.generate_category_name('PrOd', 'NoT_PrIvAtE')).to eq 'NOT_PRIVATE_PROD'
    end
  end
end
