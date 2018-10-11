# Customer
class Customer < ActiveRecord::Base
  include DatabaseHelper

  has_one :company_info, foreign_key: :duns_number, primary_key: :duns_number

  scope :by_duns, ->(duns) { where(duns_number: duns) }

  scope :by_policy_year, ->(year) { where(policy_year: year) }

  scope :renewal, ->(duns_number, year) { by_duns(duns_number).by_policy_year(year) }
end
