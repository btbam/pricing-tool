class IndustryGroup < ActiveRecord::Base
  belongs_to :business_product, class_name: ::Business::Product
  belongs_to :business_type, class_name: ::Business::Type
end
