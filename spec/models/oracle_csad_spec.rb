require 'rails_helper'

RSpec.describe OracleCsad do
  it 'can be initialized' do
    pending 'getting error: schema "L_ADM_LND" does not exist'
    expect(OracleCsad.new).to be_an(OracleCsad)
  end

  it 'behaves like an OracleRecord'
end
