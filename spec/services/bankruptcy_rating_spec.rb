require 'rails_helper'

RSpec.describe BankruptcyRating do
  before do
    class TestBankruptcyData
      attr_accessor :financial_stress_score_class, :credit_score_class

      def initialize(fsc, csc)
        self.financial_stress_score_class = fsc
        self.credit_score_class = csc
      end
    end
  end

  describe '#initialize' do
    it 'can be initialized with an empty array' do
      expect { BankruptcyRating.new([]) }.not_to raise_error
    end
  end

  describe '#process_data' do
    let(:bankruptcy_rating) { BankruptcyRating.new([]) }

    it 'returns nils if no block given' do
      expect(bankruptcy_rating.process_data).to contain_exactly(nil, nil, nil, nil)
    end

    it 'calls the given block with each of the hashes in FIELD_TO_SCORES' do
      sample_proc = proc { |f2s| f2s }
      expect(sample_proc).to receive(:call).exactly(BankruptcyRating::FIELD_TO_SCORES.count).times
      bankruptcy_rating.process_data(&sample_proc)
    end
  end

  describe '#determine_rating' do
    let(:bankruptcy_rating) { BankruptcyRating.new([]) }

    it 'sets the rating color and text' do
      bankruptcy_rating.determine_rating
      expect(bankruptcy_rating.color).not_to be_empty
      expect(bankruptcy_rating.text).not_to be_empty
    end

    it 'returns the current BankruptcyRating instance' do
      expect(bankruptcy_rating.determine_rating).to eql(bankruptcy_rating)
    end
  end

  context 'private methods' do
    shared_examples_for 'a rating setter' do
      it 'sets color' do
        expect(bankruptcy_rating.color).to eql(rating_color)
      end

      it 'sets text' do
        expect(bankruptcy_rating.text).to eql(rating_text)
      end
    end

    shared_examples_for 'a gray rating' do
      it_behaves_like 'a rating setter' do
        let(:rating_color) { 'gray' }
        let(:rating_text) { 'N/A' }
        before do
          expect(bankruptcy_rating.send(:set_gray_rating)).to be_truthy
        end
      end
    end

    describe '#set_rating' do
      it_behaves_like 'a rating setter' do
        let!(:rating_color) { 'rating-color' }
        let!(:rating_text) { 'rating-text' }
        let!(:bankruptcy_rating) { BankruptcyRating.new([]) }

        before do
          expect(bankruptcy_rating.send(:set_rating, rating_color, rating_text)).to be_truthy
        end
      end
    end

    describe '#set_gray_rating' do
      context 'data is nil' do
        it_behaves_like 'a gray rating' do
          let!(:bankruptcy_rating) { BankruptcyRating.new([]) }
        end
      end

      context 'data is empty' do
        it_behaves_like 'a gray rating' do
          let!(:data) { [TestBankruptcyData.new(nil, nil)] }
          let!(:bankruptcy_rating) { BankruptcyRating.new(data) }
        end
      end

      context 'data is partially available' do
        it_behaves_like 'a gray rating' do
          let!(:data) do
            [TestBankruptcyData.new(5, nil),
             TestBankruptcyData.new(5, 5)]
          end
          let!(:bankruptcy_rating) { BankruptcyRating.new(data) }
        end
      end

      it 'returns false when all data is available' do
        data = [TestBankruptcyData.new(5, 5)]
        rating = BankruptcyRating.new(data)
        expect(rating.send(:set_gray_rating)).to be_falsey
      end
    end

    describe '#set_green_rating' do
      context 'fsc or csc are neither medium or high' do
        it 'sets the bankruptcy rating to green' do
          bankruptcy_rating = BankruptcyRating.new([])
          expect(bankruptcy_rating.send(:set_green_rating)).to be_truthy

          data = [
            TestBankruptcyData.new(1, 1),
            TestBankruptcyData.new(1, 1),
            TestBankruptcyData.new(1, 1),
            TestBankruptcyData.new(1, 1)
          ]

          bankruptcy_rating = BankruptcyRating.new(data)
          expect(bankruptcy_rating.send(:set_green_rating)).to be_truthy

          data = [
            TestBankruptcyData.new(1, 1),
            TestBankruptcyData.new(2, 2),
            TestBankruptcyData.new(1, 1),
            TestBankruptcyData.new(2, 2)
          ]

          bankruptcy_rating = BankruptcyRating.new(data)
          expect(bankruptcy_rating.send(:set_green_rating)).to be_truthy

          data = [
            TestBankruptcyData.new(3, 3),
            TestBankruptcyData.new(3, 3),
            TestBankruptcyData.new(3, 3),
            TestBankruptcyData.new(3, 3)
          ]

          bankruptcy_rating = BankruptcyRating.new(data)
          expect(bankruptcy_rating.send(:set_green_rating)).to be_truthy
        end
      end
    end

    describe '#set_orange_rating' do
      context 'fsc or csc are medium and score classes are not stable' do
        it 'sets the bankruptcy rating to orange' do
          data = [
            TestBankruptcyData.new(4, 4),
            TestBankruptcyData.new(1, 1),
            TestBankruptcyData.new(1, 1),
            TestBankruptcyData.new(5, 5)
          ]

          bankruptcy_rating = BankruptcyRating.new(data)
          expect(bankruptcy_rating.send(:set_orange_rating)).to be_truthy

          data = [
            TestBankruptcyData.new(4, 4),
            TestBankruptcyData.new(1, 1),
            TestBankruptcyData.new(5, 5),
            TestBankruptcyData.new(1, 1)
          ]

          bankruptcy_rating = BankruptcyRating.new(data)
          expect(bankruptcy_rating.send(:set_orange_rating)).to be_truthy

          data = [
            TestBankruptcyData.new(4, 4),
            TestBankruptcyData.new(5, 5),
            TestBankruptcyData.new(1, 1),
            TestBankruptcyData.new(1, 1)
          ]

          bankruptcy_rating = BankruptcyRating.new(data)
          expect(bankruptcy_rating.send(:set_orange_rating)).to be_truthy
        end
      end
    end

    describe '#set_red_rating' do
      context 'fsc or csc are high and score classes are stable' do
        it 'sets the bankruptcy rating to red' do
          data = [
            TestBankruptcyData.new(5, 5),
            TestBankruptcyData.new(1, 1),
            TestBankruptcyData.new(1, 1),
            TestBankruptcyData.new(5, 5)
          ]

          bankruptcy_rating = BankruptcyRating.new(data)
          expect(bankruptcy_rating.send(:set_red_rating)).to be_truthy

          data = [
            TestBankruptcyData.new(5, 5),
            TestBankruptcyData.new(1, 1),
            TestBankruptcyData.new(5, 5),
            TestBankruptcyData.new(1, 1)
          ]

          bankruptcy_rating = BankruptcyRating.new(data)
          expect(bankruptcy_rating.send(:set_red_rating)).to be_truthy

          data = [
            TestBankruptcyData.new(5, 5),
            TestBankruptcyData.new(5, 5),
            TestBankruptcyData.new(1, 1),
            TestBankruptcyData.new(1, 1)
          ]

          bankruptcy_rating = BankruptcyRating.new(data)
          expect(bankruptcy_rating.send(:set_red_rating)).to be_truthy
        end
      end
    end

    describe '#all_data_available?' do
      it 'returns false when data is nil' do
        bankruptcy_rating = BankruptcyRating.new([])
        expect(bankruptcy_rating.send(:all_data_available?)).to be_falsey
      end

      it 'returns false when data is empty' do
        data = [TestBankruptcyData.new(nil, nil)]
        bankruptcy_rating = BankruptcyRating.new(data)
        expect(bankruptcy_rating.send(:all_data_available?)).to be_falsey
      end

      it 'returns false when data is partially empty' do
        data = [TestBankruptcyData.new(4, nil),
                TestBankruptcyData.new(5, 5)]
        bankruptcy_rating = BankruptcyRating.new(data)
        expect(bankruptcy_rating.send(:all_data_available?)).to be_falsey
      end

      it 'returns true when all data is available' do
        data = [TestBankruptcyData.new(4, 5),
                TestBankruptcyData.new(5, 5)]
        bankruptcy_rating = BankruptcyRating.new(data)
        expect(bankruptcy_rating.send(:all_data_available?)).to be_truthy
      end
    end

    describe '#find_missing_fields' do
      let(:fsc) { { field: :financial_stress_score_class } }
      let(:csc) { { field: :credit_score_class } }

      it 'returns a non-empty array when fields are missing' do
        data = [TestBankruptcyData.new(5, 5),
                TestBankruptcyData.new(5, nil),
                TestBankruptcyData.new(nil, nil),
                TestBankruptcyData.new(nil, 5)]
        bankruptcy_rating = BankruptcyRating.new(data)
        expect(bankruptcy_rating.send(:find_missing_fields, fsc).count).to eql(2)
        expect(bankruptcy_rating.send(:find_missing_fields, csc).count).to eql(2)
      end

      it 'returns an empty array when no missing data' do
        data = [TestBankruptcyData.new(4, 5),
                TestBankruptcyData.new(5, 5)]
        bankruptcy_rating = BankruptcyRating.new(data)
        expect(bankruptcy_rating.send(:find_missing_fields, fsc)).to be_empty
        expect(bankruptcy_rating.send(:find_missing_fields, csc)).to be_empty
      end
    end
  end
end
