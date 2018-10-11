require 'rails_helper'

RSpec.describe DnoPeerGroupApi do
  describe 'DnoPeerGroupApi object' do
    let(:company_info) { build(:company_info) }
    let(:sic_code) { company_info.industry_code }
    let!(:dno) { create(:business_product, name: 'DO') }
    let!(:business_type) { create(:business_type, name: 'PRIVATE') }
    let(:peer_group_api) { DnoPeerGroupApi.new(company_info, 'PRIVATE', sic_code) }
    let!(:industry_group) do
      create(:industry_group,
             sic_code: company_info.industry_code,
             business_product_id: dno.id,
             business_type_id: business_type.id)
    end

    it 'can be initialized' do
      expect { PeerGroupApi.new(company_info, 'PRIVATE', sic_code) }.not_to raise_error
    end

    it 'sets the business_product to D&O' do
      expect(peer_group_api.instance_variable_get(:@business_product)).to eq(dno)
    end

    describe '#peer_group' do
      let!(:dno_group) do
        create(:dno_group,
               industry_groups: industry_group.industry,
               min_sales: company_info.sales_volume.to_i,
               max_f: company_info.financial_stress_score)
      end
      it 'requires peer_group to be implemented' do
        expect(peer_group_api.peer_group).to eq(dno_group)
      end
    end
  end
end
