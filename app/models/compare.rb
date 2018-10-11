# Compare
class Compare < ActiveRecord::Base
  include CompareHelper

  belongs_to :compare_type, polymorphic: true
  belongs_to :business_product, class_name: ::Business::Product
  belongs_to :business_type, class_name: ::Business::Type
  belongs_to :business_year, class_name: ::Business::Year
end
