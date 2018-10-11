# DatabaseHelper
module DatabaseHelper
  extend ActiveSupport::Concern

  included do
    scope :bankruptcy_data, ->(duns_number) { by_duns(duns_number).time_ago(DateHelper.two_years_ago) }
  end

  module ClassMethods
    def find_by_duns(duns)
      by_duns(duns).limit(1).first
    end

    def find_by_duns_and_date(duns, date)
      by_duns(duns).by_date(date).limit(1).first
    end
  end

  def bankruptcy_data
    self.class.bankruptcy_data(duns_number)
  end
end
