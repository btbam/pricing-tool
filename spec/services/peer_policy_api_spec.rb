require 'rails_helper'

RSpec.describe PeerPolicyApi do
  describe 'PeerPolicyApi object' do
    let(:company_info) { build(:company_info) }
    let(:sic_code) { company_info.industry_code }
    let!(:dno) { create(:business_product, name: 'DO') }
    let!(:epli) { create(:business_product, name: 'EPLI') }
    let!(:private) { create(:business_type, name: 'PRIVATE') }

    it 'can be initialized' do
      expect(EpliPeerGroupApi).to receive(:new).with(company_info, 'PRIVATE', sic_code)
      expect(DnoPeerGroupApi).to receive(:new).with(company_info, 'PRIVATE', sic_code)
      expect { PeerPolicyApi.new(company_info, sic_code) }.not_to raise_error
    end
  end
end
