require 'rails_helper'

RSpec.describe DnbCleaner do
  let(:dnb_cleaner_test) do
    class DnbCleanerTest
      include DnbCleaner
    end
    DnbCleanerTest.new
  end

  describe '#sic_first' do
    it 'returns nil if value is empty' do
      allow(dnb_cleaner_test).to receive(:send).with(:some_test_field).and_return('')
      expect(dnb_cleaner_test.sic_first(:some_test_field)).to be_nil
    end

    it 'returns value[0] if size is 3' do
      allow(dnb_cleaner_test).to receive(:send).with(:some_test_field).and_return('foo')
      expect(dnb_cleaner_test.sic_first(:some_test_field)).to eql('f')
    end

    it 'returns value[0..1] if size is not 3' do
      allow(dnb_cleaner_test).to receive(:send).with(:some_test_field).and_return('xyzzy')
      expect(dnb_cleaner_test.sic_first(:some_test_field)).to eql('xy')
    end
  end
end
