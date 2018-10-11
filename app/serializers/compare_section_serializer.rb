# CompareSectionSerializer
class CompareSectionSerializer < ActiveModel::Serializer
  self.root = false

  attributes :loss_ratio, :menu, :menu_select, :total_policies, :total_policies_with_claims
end
