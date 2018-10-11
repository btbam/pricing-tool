require 'rails_helper'

RSpec.shared_examples 'removes various common terms from the end of company name' do |term|
  it "Removes variations of #{term} from the end of company name" do
    parser = ApiParser::GoogleJSON.new(query: "test query, #{term.upcase}.")
    expect(parser.query).to eql('test query')

    parser = ApiParser::GoogleJSON.new(query: "test query #{term.downcase}.")
    expect(parser.query).to eql('test query')

    parser = ApiParser::GoogleJSON.new(query: "test query #{term.titleize}")
    expect(parser.query).to eql('test query')

    parser = ApiParser::GoogleJSON.new(query: "#{term.titleize} test query")
    expect(parser.query).to eql("#{term.titleize} test query")
  end
end

RSpec.describe ApiParser::GoogleJSON do
  it_should_behave_like 'removes various common terms from the end of company name', 'inc'
  it_should_behave_like 'removes various common terms from the end of company name', 'llc'
  it_should_behave_like 'removes various common terms from the end of company name', 'corp'

  describe '#pages_total' do
    it 'returns an accurate page count for results_total not divisible by RESULTS_PER_PAGE' do
      results_total = ApiParser::GoogleJSON::RESULTS_PER_PAGE + 1
      allow_any_instance_of(ApiParser::GoogleJSON).to receive(:results_total).and_return(results_total)
      parser = ApiParser::GoogleJSON.new(query: 'test query')
      expect(parser.pages_total).to eql(2)
    end

    it 'returns an accurate page count for results_total divisible by RESULTS_PER_PAGE' do
      results_total = ApiParser::GoogleJSON::RESULTS_PER_PAGE
      allow_any_instance_of(ApiParser::GoogleJSON).to receive(:results_total).and_return(results_total)
      parser = ApiParser::GoogleJSON.new(query: 'test query')
      expect(parser.pages_total).to eql(1)
    end
  end

  context 'private methods' do
    let(:query) { 'test company' }
    let(:parser) { ApiParser::GoogleJSON.new(query: query) }
    let(:y2k_timestamp) { '1999-12-31 12:59:59' }
    let(:y2k) { Time.parse(y2k_timestamp) }
    let(:empty_result) do
      {
        'pagemap' => {},
        'snippet' => ''
      }
    end

    describe '#parse_date' do
      it 'parses metatags from the result' do
        allow(parser).to receive(:parse_date_from_metatags).and_return(y2k)
        expect(parser.send(:parse_date, empty_result)).to eql(y2k)
      end

      it 'parses offset from words when metatags are fruitless' do
        allow(parser).to receive(:parse_date_from_metatags).and_return(nil)
        allow(parser).to receive(:parse_offset_from_words).and_return(y2k)
        expect(parser.send(:parse_date, empty_result)).to eql(y2k)
      end

      it 'parses time from words when no offset' do
        allow(parser).to receive(:parse_date_from_metatags).and_return(nil)
        allow(parser).to receive(:parse_offset_from_words).and_return(nil)
        result = empty_result
        result['snippet'] = "#{y2k_timestamp} ... Some story a long time ago ..."
        expect(parser.send(:parse_date, result)).to eql(y2k)
      end

      it 'returns now as a last resort' do
        allow(parser).to receive(:parse_date_from_metatags).and_return(nil)
        allow(parser).to receive(:parse_offset_from_words).and_return(nil)
        allow(Time).to receive(:now).and_return(y2k)
        expect(parser.send(:parse_date, empty_result)).to eql(y2k)
      end
    end

    describe '#parse_date_from_metatags' do
      it 'returns nil when metatags is nil' do
        expect(parser.send(:parse_date_from_metatags, nil)).to be_nil
      end

      it 'parses for pubdate' do
        metatags = {
          'pubdate' => y2k_timestamp,
          'revision_date' => nil
        }
        expect(parser.send(:parse_date_from_metatags, metatags)).to eql(y2k)
      end

      it 'parses for revision_date when pubdate fails' do
        metatags = {
          'pubdate' => nil,
          'revision_date' => y2k_timestamp
        }
        expect(parser.send(:parse_date_from_metatags, metatags)).to eql(y2k)
      end

      it 'returns nil when both revision_date and pubdate fail' do
        metatags = {
          'pubdate' => nil,
          'revision_date' => nil
        }
        expect(parser.send(:parse_date_from_metatags, metatags)).to be_nil
      end
    end

    describe '#parse_offset_from_words' do
      it 'returns nil if words arent formatted properly' do
        words = 'something improper'
        expect(parser.send(:parse_offset_from_words, words)).to be_nil
      end

      it 'returns nil if count is 0' do
        words = '0 days ago ... a story four days ago ...'
        expect(parser.send(:parse_offset_from_words, words)).to be_nil
      end

      it 'returns nil if count is numeric but units is invalid' do
        words = '12 parsecs away ... a story four days ago ...'
        expect(parser.send(:parse_offset_from_words, words)).to be_nil
      end

      it 'returns the correct time if words are formatted properly' do
        now = Time.now
        expected = now - 4.days
        allow(Time).to receive(:now).and_return(now)

        words = '4 days ago ... a story four days ago ...'
        expect(parser.send(:parse_offset_from_words, words)).to eql(expected)
      end
    end

    describe 'parse_meta' do
      it 'returns nil if searchInformation is empty' do
        meta = { 'searchInformation' => nil }
        allow(parser).to receive(:raw_feed_json).and_return meta
        expect(parser.send(:parse_meta)).to be_nil
      end

      context 'valid meta' do
        let!(:valid_meta) do
          {
            'searchInformation' => {
              'totalResults' => 123_456,
              'searchTime' => 1.21
            }
          }
        end

        before do
          allow(parser).to receive(:raw_feed_json).and_return valid_meta
          parser.send(:parse_meta)
        end

        it 'sets results_total' do
          expect(parser.instance_variable_get(:@results_total)).not_to be_nil
        end

        it 'sets results_time' do
          expect(parser.instance_variable_get(:@results_time)).not_to be_nil
        end
      end
    end
  end
end
