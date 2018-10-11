require 'rails_helper'

RSpec.describe SearchSerializer do
  let(:company) { build(:company_info) }
  let(:serializer) { SearchSerializer.new(company) }

  describe '#to_json' do
    it 'returns valid json' do
      json = serializer.to_json
      expect { JSON.parse(json) }.not_to raise_error
    end
  end
end
