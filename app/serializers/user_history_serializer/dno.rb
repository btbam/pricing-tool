class UserHistorySerializer::Dno < ActiveModel::Serializer
  self.root = false

  attributes :claims_history, :entity_nonentity_coverage, :financial_conditions, :has_changed, :industry,
             :limit, :litigation, :management_experience_qualifications, :mergers_and_acquisitions, :private_company,
             :retention, :revenue_asset_irregularities, :specialty_coverage, :years_in_operation
end
