class PeerGroupSerializer < ActiveModel::Serializer
  attributes :non_zero_policies, :max_loss_severity, :group_rate_need, :group_rate_need,
             :group_predicted_loss_ratio, :group_historical_loss_ratio
  has_one :current_policy, serializer: PolicySerializer
  has_many :nearest_policies, serializer: PolicySerializer
end
