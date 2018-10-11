# SearchShowAllSerializer
class SearchShowAllSerializer < ActiveModel::Serializer
  attributes :duns_number, :name, :street_address, :city, :state, :zip_code,
             :customer, :sales_volume, :global_employee_total

  def customer
    object.customer.to_i == 1
  end

  def global_employee_total
    object.global_employee_total.to_i
  end
end
