require 'rails_helper'

RSpec.describe PeerGroupApi do
  describe 'PeerPolicyApi object' do
    let(:company_info) { build(:company_info) }
    let(:sic_code) { company_info.industry_code }
    let!(:dno) { create(:business_product, name: 'DO') }
    let!(:epli) { create(:business_product, name: 'EPLI') }
    let!(:business_type) { create(:business_type, name: 'PRIVATE') }
    let(:peer_group_api) { PeerGroupApi.new(company_info, 'PRIVATE', sic_code) }

    it 'can be initialized' do
      expect { PeerGroupApi.new(company_info, 'PRIVATE', sic_code) }.not_to raise_error
    end

    describe '#peer_group' do
      it 'requires peer_group to be implemented' do
        expect { peer_group_api.peer_group }.to raise_error
      end
    end

    describe '#max_loss_severity' do
      it 'returns nil when no peer_group exists' do
        expect(peer_group_api.max_loss_severity).to eq(0.0)
      end

      it 'returns max_loss when the peer_group exists' do
        os = OpenStruct.new
        os.max_loss = 10
        peer_group_api.instance_variable_set(:@peer_group, os)
        expect(peer_group_api.max_loss_severity).to eq(10.0)
      end
    end

    describe '#group_rate_need' do
      it 'returns nil when no peer_group exists' do
        expect(peer_group_api.group_rate_need).to eq(0.0)
      end

      it 'returns cap_rt_need when the peer_group exists' do
        os = OpenStruct.new
        os.cap_rt_need = 10
        peer_group_api.instance_variable_set(:@peer_group, os)
        expect(peer_group_api.group_rate_need).to eq(10.0)
      end
    end

    describe '#group_predicted_loss_ratio' do
      it 'returns nil when no peer_group exists' do
        expect(peer_group_api.group_predicted_loss_ratio).to eq(0.0)
      end

      it 'returns pred_lr when the peer_group exists' do
        os = OpenStruct.new
        os.pred_lr = 10
        peer_group_api.instance_variable_set(:@peer_group, os)
        expect(peer_group_api.group_predicted_loss_ratio).to eq(10.0)
      end
    end

    describe '#group_historical_loss_ratio' do
      it 'returns nil when no peer_group exists' do
        expect(peer_group_api.group_historical_loss_ratio).to eq(0.0)
      end

      it 'returns actual_lr when the peer_group exists' do
        os = OpenStruct.new
        os.actual_lr = 10
        peer_group_api.instance_variable_set(:@peer_group, os)
        expect(peer_group_api.group_historical_loss_ratio).to eq(10.0)
      end
    end

    describe '#industry_group' do
      let!(:industry_group) do
        create(:industry_group,
               sic_code: company_info.industry_code,
               business_product_id: epli.id,
               business_type_id: business_type.id)
      end
      it 'retrieves the industry group for the peer group' do
        peer_group_api.instance_variable_set(:@business_product, epli)
        peer_group_api.instance_variable_set(:@business_type, business_type)
        expect(peer_group_api.industry_group).to eq(industry_group.industry)
      end
    end

    describe '#nearest_policies' do
      it 'call to find nearest forty policies' do
        peer_group_api.instance_variable_set(:@business_product, epli)
        expect(Policy).to receive(:nearest_forty).with(company_info.industry_code.to_s,
                                                       epli.id,
                                                       company_info.sales_volume,
                                                       company_info.duns_number)
        peer_group_api.nearest_policies
      end
    end

    describe '#non_zero_policies' do
      it 'retrieves policies with non-zero claims'
    end
  end
end
