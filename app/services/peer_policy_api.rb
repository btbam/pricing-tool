class PeerPolicyApi
  include ActiveModel::Serialization

  attr_accessor :dno_policy_data, :epli_policy_data

  # Generates a new PeerPolicyApi object using the supplied params
  #
  # @param company_info [CompanyInfo] the CompanyInfo object used to generate
  #   new peer group objects
  def initialize(company_info, sic_first)
    @dno_policy_data = DnoPeerGroupApi.new(company_info, 'PRIVATE', sic_first)
    @epli_policy_data = EpliPeerGroupApi.new(company_info, 'PRIVATE', sic_first)
  end
end
