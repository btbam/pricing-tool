require 'rails_helper'

RSpec.describe OracleRecord do
  # OracleRecord is abstract, so we need our own implementation
  before do
    class TestOracleRecord < OracleRecord
    end
  end

  it 'does not respond to delete_all/destroy_all methods' do
    expect(TestOracleRecord).not_to respond_to(:delete_all)
    expect(TestOracleRecord).not_to respond_to(:destroy_all)
  end

  it 'does not respond to delete/destroy methods' do
    pending 'not sure how to test this, getting: relation "test_oracle_records" does not exist'
    test = TestOracleRecord.new
    expect(test).not_to respond_to(:delete)
    expect(test).not_to respond_to(:destroy)
  end

  it 'behaves like an OracleRecord'
end
