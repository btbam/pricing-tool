class PeerPoliciesSerializer < ActiveModel::Serializer
  attributes :dno_policies, :epli_policies
  def dno_policies
    PeerGroupSerializer.new(object.dno_policy_data)
  end

  def epli_policies
    PeerGroupSerializer.new(object.epli_policy_data)
  end
end
