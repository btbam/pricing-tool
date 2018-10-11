require 'rails_helper'

RSpec.describe OracleSmad do
  it 'can be initialized' do
    pending 'getting error: schema "L_ADM_LND" does not exist'
    expect(OracleSmad.new).to be_an(OracleSmad)
  end

  it 'behaves like an OracleRecord'
end
