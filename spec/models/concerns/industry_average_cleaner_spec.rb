require 'rails_helper'

RSpec.describe IndustryAverageCleaner do
  let!(:industry_average_cleaner_test) do
    class IndustryAverageCleanerTest < ActiveRecord::Base
      self.table_name = 'industry_averages'
      include IndustryAverageCleaner
      def sic_code; end
    end
    IndustryAverageCleanerTest.new
  end

  describe '#by_industry_code' do
    let!(:industry_average) { FactoryGirl.create(:industry_average, sic_code: '43') }

    it 'returns industry_average with that sic_code' do
      expect(IndustryAverage.by_industry_code('4321')).to eq [industry_average]
    end

    it 'does not return industry_average with a different sic_code' do
      expect(IndustryAverage.by_industry_code('1234')).to eq []
    end
  end

  describe '#sic_first' do
    it 'returns nil if value is empty' do
      allow(industry_average_cleaner_test).to receive(:sic_code).and_return('')
      expect(industry_average_cleaner_test.sic_first).to be_nil
    end

    it 'returns value[0] if size is 3' do
      allow(industry_average_cleaner_test).to receive(:sic_code).and_return('foo')
      expect(industry_average_cleaner_test.sic_first).to eql('f')
    end

    it 'returns value[0..1] if size is not 3' do
      allow(industry_average_cleaner_test).to receive(:sic_code).and_return('xyzzy')
      expect(industry_average_cleaner_test.sic_first).to eql('xy')
    end
  end
end
