require 'rails_helper'

RSpec.describe Customer do
  it 'can be initialized' do
    expect(Customer.new).to be_a(Customer)
  end

  describe 'scopes' do
    describe '#by_duns' do
      let(:customer) { FactoryGirl.create(:customer, duns_number: 1) }

      it 'queries by duns_number' do
        customer.reload
        expect(Customer.by_duns(1).first).to eq customer
      end
    end

    describe '#by_policy_year' do
      let(:customer) { FactoryGirl.create(:customer, policy_year: Time.now.year) }

      it 'queries by policy year' do
        customer.reload
        expect(Customer.by_policy_year(Time.now.year).first).to eq customer
      end
    end

    describe '#renewal' do
      let(:customer) { FactoryGirl.create(:customer, duns_number: 1, policy_year: Time.now.year) }

      it 'queries by renewal' do
        customer.reload
        expect(Customer.renewal(1, Time.now.year).first).to eq customer
      end
    end
  end
end
