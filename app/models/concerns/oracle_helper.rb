# OracleHelper
module OracleHelper
  extend ActiveSupport::Concern

  included do
    scope :by_duns, ->(duns) { where(duns_number: duns).order(as_of_dt: :desc) }
    scope :by_date, ->(date) { where(as_of_dt: date) }
    scope :time_ago, ->(time_ago) { where('as_of_dt >= :time_ago', time_ago: time_ago) }
  end
end
