require 'rails_helper'

RSpec.describe ImporterRun do
  it 'can be initialized' do
    expect(ImporterRun.new).to be_an(ImporterRun)
  end
end
