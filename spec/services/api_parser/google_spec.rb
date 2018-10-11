RSpec.describe ApiParser::Google do
  describe '#pages_total' do
    it 'returns an accurate page count for results_total not divisible by RESULTS_PER_PAGE' do
      results_total = ApiParser::Google::RESULTS_PER_PAGE + 1
      allow_any_instance_of(ApiParser::Google).to receive(:results_total).and_return(results_total)
      parser = ApiParser::Google.new(query: 'test query')
      expect(parser.pages_total).to eql(2)
    end

    it 'returns an accurate page count for results_total divisible by RESULTS_PER_PAGE' do
      results_total = ApiParser::Google::RESULTS_PER_PAGE
      allow_any_instance_of(ApiParser::Google).to receive(:results_total).and_return(results_total)
      parser = ApiParser::Google.new(query: 'test query')
      expect(parser.pages_total).to eql(1)
    end
  end
end
