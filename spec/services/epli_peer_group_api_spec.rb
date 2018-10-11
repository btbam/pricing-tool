require 'rails_helper'

RSpec.describe EpliPeerGroupApi do
  describe 'EpliPeerGroupApi object' do
    let(:company_info) { build(:company_info) }
    let(:sic_code) { company_info.industry_code }
    let!(:epli) { create(:business_product, name: 'EPLI') }
    let!(:business_type) { create(:business_type, name: 'PRIVATE') }
    let(:peer_group_api) { EpliPeerGroupApi.new(company_info, 'PRIVATE', sic_code) }
    let!(:industry_group) do
      create(:industry_group,
             sic_code: company_info.industry_code,
             business_product_id: epli.id,
             business_type_id: business_type.id)
    end

    it 'can be initialized' do
      expect { PeerGroupApi.new(company_info, 'PRIVATE', sic_code) }.not_to raise_error
    end

    it 'sets the business_product to D&O' do
      expect(peer_group_api.instance_variable_get(:@business_product)).to eq(epli)
    end

    describe '#peer_group' do
      let!(:epli_group) do
        create(:epli_group,
               industry_groups: industry_group.industry,
               min_empl: company_info.global_employee_total)
      end
      it 'requires peer_group to be implemented' do
        expect(peer_group_api.peer_group).to eq(epli_group)
      end
    end

    describe '#state_group' do
      it 'returns California when CA' do
        allow(company_info).to receive(:hq_state).and_return('CA')
        expect(peer_group_api.state_group).to eq('California')
      end

      it 'returns non_California when not CA' do
        allow(company_info).to receive(:hq_state).and_return('FL')
        expect(peer_group_api.state_group).to eq('non_California')
      end

      it 'returns All when nil' do
        allow(company_info).to receive(:hq_state).and_return(nil)
        expect(peer_group_api.state_group).to eq('All')
      end
    end
  end
end
