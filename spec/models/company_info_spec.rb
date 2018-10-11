require 'rails_helper'

RSpec.describe CompanyInfo do
  let(:today) { Time.zone.now }
  let(:one_year_ago) { 1.year.ago(today) }
  let(:two_years_ago) { 2.years.ago(today) }
  let(:three_years_ago) { 3.years.ago(today) }

  # TODO: should we test the attr_accessors?

  describe 'scopes' do
    let!(:info1) { create(:company_info, duns_number: 123, as_of_date: today) }
    let!(:old_info1) { create(:company_info, duns_number: info1.duns_number, as_of_date: one_year_ago) }
    let!(:older_info1) { create(:company_info, duns_number: info1.duns_number, as_of_date: two_years_ago) }
    let!(:info2) { create(:company_info, duns_number: 456, as_of_date: today) }

    describe '.by_duns' do
      it 'matches duns_number properly' do
        by_duns = CompanyInfo.by_duns(info2.duns_number)
        expect(by_duns).to include(info2)
        expect(by_duns).not_to include(info1)
        expect(by_duns).not_to include(old_info1)
        expect(by_duns).not_to include(older_info1)
      end

      it 'orders by date descending' do
        expect(CompanyInfo.by_duns(info1.duns_number).to_a).to eql([info1, old_info1, older_info1])
      end
    end

    describe '.by_date' do
      it 'matches as_of_date' do
        by_date = CompanyInfo.by_date(today)
        expect(by_date).to include(info1)
        expect(by_date).to include(info2)
        expect(by_date).not_to include(old_info1)
        expect(by_date).not_to include(older_info1)
      end
    end

    describe '.time_ago' do
      it 'matches all as_of_date since specified time ago' do
        time_ago = CompanyInfo.time_ago(one_year_ago)
        expect(time_ago).to include(info1)
        expect(time_ago).to include(info2)
        expect(time_ago).to include(old_info1)
        expect(time_ago).not_to include(older_info1)
      end
    end
  end

  describe '#industry_average' do
    let(:company_info) { build(:company_info) }
    let(:sic_code) { 777 }
    let(:es_company) { Company.new(sic_code_first: sic_code) }

    it 'returns nil if duns_number is falsey' do
      nil_duns = build(:company_info, duns_number: nil)
      expect(nil_duns.industry_average).to be_nil
    end

    it "returns the IndustryAverage matching this CompanyInfo's sic code" do
      industry_average = create(:industry_average, sic_code: sic_code)
      allow_any_instance_of(CompanyRepository).to receive(:find_by_duns).and_return(es_company)
      expect(company_info.industry_average).to eql(industry_average)
    end

    it "returns nil if no IndustryAverage matches this CompanyInfo's sic code" do
      allow_any_instance_of(CompanyRepository).to receive(:find_by_duns).and_return(nil)
      expect(company_info.industry_average).to be_nil
    end
  end

  describe '#business_product=' do
    let(:company_info) { build(:company_info) }
    let!(:business_product) { FactoryGirl.create(:business_product, name: 'DO') }

    it 'returns the business_product' do
      company_info.business_product = 'do'
      expect(company_info.business_product).to eq business_product
    end
  end

  describe '#business_type=' do
    let(:company_info) { build(:company_info) }
    let!(:business_type) { FactoryGirl.create(:business_type, name: 'PRIVATE') }

    it 'returns the business_product' do
      company_info.business_type = 'private'
      expect(company_info.business_type).to eq business_type
    end
  end

  describe '#bankruptcy_data' do
    let!(:current_info) { create(:company_info, duns_number: 123) }
    let!(:old_info) { create(:company_info, duns_number: current_info.duns_number, as_of_date: one_year_ago) }
    let!(:older_info) { create(:company_info, duns_number: current_info.duns_number, as_of_date: two_years_ago) }
    let!(:oldest_info) { create(:company_info, duns_number: current_info.duns_number, as_of_date: three_years_ago) }

    let(:bankruptcy_data) { current_info.bankruptcy_data }

    it 'returns all info for this duns_number since two years ago' do
      expect(bankruptcy_data).to include(current_info)
      expect(bankruptcy_data).to include(old_info)
      expect(bankruptcy_data).to include(older_info)
    end

    it 'sorts by as_of_date in descending order' do
      expect(bankruptcy_data.to_a).to eql([current_info, old_info, older_info])
    end

    it 'does not return info for this duns_number since before two years ago' do
      expect(bankruptcy_data).not_to include(oldest_info)
    end
  end

  describe '#current_dno_policy' do
    let(:business_product) { create(:business_product, name: 'DO') }
    let(:ci) { create(:company_info) }
    let!(:policy) do
      create(:policy,
             business_product: business_product,
             duns_number: ci.duns_number)
    end

    it 'grabs the dno policy with the most recent year' do
      expect(ci.current_dno_policy).to eq(policy)
    end
  end

  describe '#current_epli_policy' do
    let(:business_product) { create(:business_product, name: 'EPLI') }
    let(:ci) { create(:company_info) }
    let!(:policy) do
      create(:policy,
             business_product: business_product,
             duns_number: ci.duns_number)
    end
    it 'grabs the epli policy with the most recent year' do
      expect(ci.current_epli_policy).to eq(policy)
    end
  end
end
