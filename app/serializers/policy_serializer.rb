class PolicySerializer < ActiveModel::Serializer
  attributes :duns_number, :name, :policy_number, :limit, :retention, :sales, :gwp, :loss_severity, :tax_state_abbr,
             :sic_code, :product, :type, :employee_count, :policy_year
end
