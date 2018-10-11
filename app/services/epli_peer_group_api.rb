class EpliPeerGroupApi < PeerGroupApi
  include ActiveModel::Serialization

  # Generates a new EpliPeerGroupApi object using the supplied params
  #
  # @param company_info [CompanyInfo] the CompanyInfo object to get data about
  # @param type [String] the Business::Type to check against
  def initialize(company_info, type, sic_first)
    super
    @business_product = Business::Product.find_by(name: 'EPLI')
    @current_policy = @company_info.current_epli_policy
    @peer_group = peer_group
    @sic_first = sic_first
  end

  def get_industry_group(sic_code)
    IndustryGroup.find_by(
      business_product: @business_product,
      business_type: @business_type,
      sic_code: sic_code
    )
  end

  # Retrieve the IndustryGroup associated to the CompanyInfo object
  #
  # @return [String] the industry name of the IndustryGroup associated to the CompanyInfo object
  def industry_group
    industry_group_by_sic = get_industry_group(@sic_first)
    industry_group_missing =
      get_industry_group('missing')
    if industry_group_by_sic
      industry_group_by_sic.industry
    else
      industry_group_missing.industry
    end
  end

  # Retrieves the EPLI Peer Group associated to the CompanyInfo object
  #
  # @return [EpliGroup] the EpliGroup associated to the CompanyInfo object
  def peer_group
    employee_total = @company_info.global_employee_total.to_i
    EpliGroup.peer_group(state_group, industry_group, employee_total)
  end

  #:reek:NilCheck
  # Retrieves the state group associated to the current policy
  # Fallback to the state associated to the CompanyInfo object if no current policy exists
  #
  # @return [String] the state group associated to the CompanyInfo object
  def state_group
    state = @current_policy ? @current_policy.tax_state_abbr : @company_info.hq_state
    case state
    when nil
      'All'
    when 'CA'
      'California'
    else
      'non_California'
    end
  end
end
