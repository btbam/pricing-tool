require 'rails_helper'

RSpec.describe DateHelper do
  let(:year) { 2014 }
  let(:day) { 13 }

  describe '.two_years_ago' do
    it 'returns the date on the first of the January two years ago for months 1-6' do
      (1..6).each do |month|
        allow(Time).to receive(:now).and_return(Time.new(year, month, day))
        expect(Time.now).to be_a(Time)

        two_years_ago = DateHelper.two_years_ago
        expect(two_years_ago.day).to eql(1)
        expect(two_years_ago.month).to eql(1)
        expect(two_years_ago.year).to eql(year - 2)
      end
    end

    it 'returns the date on the first of July two years ago for months 7-12' do
      (7..12).each do |month|
        allow(Time).to receive(:now).and_return(Time.new(year, month, day))
        expect(Time.now).to be_a(Time)

        two_years_ago = DateHelper.two_years_ago
        expect(two_years_ago.day).to eql(1)
        expect(two_years_ago.month).to eql(7)
        expect(two_years_ago.year).to eql(year - 2)
      end
    end
  end

  describe '.interval_now' do
    let(:two_years_ago) { Time.new(2015, 1, 1) }
    it 'returns a date pinned to the previous 6 month block' do
      expect(DateHelper).to receive(:two_years_ago).and_return(two_years_ago)

      expect(DateHelper.interval_now).to eq Time.new(2017, 1, 1)
    end
  end

  describe '.intervals' do
    let(:from) { Time.new(2013, 2, 5) }
    it 'returns an array of dates spaning the interval to the present 6 month block' do
      expect(DateHelper).to receive(:interval_now).and_return(Time.new(2015, 4, 18))

      expect(DateHelper.intervals(from, 3.months)).to eq [Time.new(2013, 2, 5),
                                                          Time.new(2013, 5, 5),
                                                          Time.new(2013, 8, 5),
                                                          Time.new(2013, 11, 5),
                                                          Time.new(2014, 2, 5),
                                                          Time.new(2014, 5, 5),
                                                          Time.new(2014, 8, 5),
                                                          Time.new(2014, 11, 5),
                                                          Time.new(2015, 2, 5)]
    end
  end
end
