class DnoPeerGroupApi < PeerGroupApi
  include ActiveModel::Serialization

  # Generates a new DnoPeerGroupApi object using the supplied params
  #
  # @param company_info [CompanyInfo] the CompanyInfo object to get data about
  # @param type [String] the Business::Type to check against
  def initialize(company_info, type, sic_first)
    super
    @business_product = Business::Product.find_by(name: 'DO')
    @current_policy = @company_info.current_dno_policy
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

  # Retrieves the D&O Peer Group associated to the CompanyInfo object
  #
  # @return [DnoGroup] the DnoGroup associated to the CompanyInfo object
  def peer_group
    sales = @current_policy ? @current_policy.sales : @company_info.sales_volume.to_i
    stress_score = @company_info.financial_stress_score.to_i
    DnoGroup.peer_group(industry_group, sales, stress_score)
  end
end
