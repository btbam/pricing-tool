require 'rails_helper'

RSpec.describe DatabaseHelper do
  describe DatabaseHelper::ClassMethods do
    before do
      class DatabaseHelperTest < ActiveRecord::Base
        include DatabaseHelper
        self.table_name = 'company_infos'

        scope :by_duns, ->(duns) { where(duns_number: duns).order(as_of_date: :desc) }
        scope :by_date, ->(date) { where(as_of_date: date) }
      end
    end

    let(:today) { Time.zone.now }
    let(:one_year_ago) { 1.year.ago(today) }
    let(:two_years_ago) { 2.years.ago(today) }

    let(:info1) { create(:company_info, as_of_date: today) }
    let(:old_info1) { create(:company_info, duns_number: info1.duns_number, as_of_date: one_year_ago) }
    let(:info2) { create(:company_info, as_of_date: two_years_ago) }

    describe '.find_by_duns' do
      it 'applies the by_duns scope and returns the first result' do
        result = DatabaseHelperTest.find_by_duns(info1.duns_number)
        expect(result.id).to eql(info1.id)
      end
    end

    describe '.find_by_duns_and_date' do
      it 'applies the by_duns and by_date scopes and returns the first result' do
        result = DatabaseHelperTest.find_by_duns_and_date(info1.duns_number, info1.as_of_date)
        expect(result.id).to eql(info1.id)
      end
    end
  end
end
