class PeerGroupApi
  include ActiveModel::Serialization
  attr_reader :current_policy

  # Generates a new PeerGroupApi object using the supplied params
  #
  # @param company_info [CompanyInfo] the CompanyInfo object to get data about
  # @param type [String] the Business::Type to check against
  def initialize(company_info, type, sic_first)
    @company_info = company_info
    @current_policy = nil
    @business_product = nil
    @business_type = Business::Type.find_by(name: type)
    @sic_first = sic_first.to_s
  end

  # Retrieves the nearest 10 polices to the current policy
  # If there is no current policy then retrieve the 10 policies closest base on the company
  #
  # @return [Array<Policy>] the array of 10 nearest policies
  def nearest_policies
    product_id = @business_product.id
    duns_number = @company_info.duns_number
    if @current_policy
      Policy.nearest_forty(@sic_first, product_id, @current_policy.sales, duns_number)
    else
      Policy.nearest_forty(@sic_first, product_id, @company_info.sales_volume, duns_number)
    end
  end

  def non_zero_policies
    { 'non_zero' => nil.to_i,
      'total_policies' => @peer_group.try(:npol).to_i }
  end

  # Atempts to retrive the max_loss for the peer group. Returns nil if no peer group
  #
  # @return [Integer, nil] the max_loss value associated to the peer group
  def max_loss_severity
    @peer_group.try(:max_loss).to_f
  end

  # Atempts to retrive the group_rate_need for the peer group. Returns nil if no peer group
  #
  # @return [Integer, nil] the cap_rt_need value associated to the peer group
  def group_rate_need
    @peer_group.try(:cap_rt_need).to_f
  end

  # Atempts to retrive the group_predicted_loss_ratio for the peer group. Returns nil if no peer group
  #
  # @return [Integer, nil] the pred_lr value associated to the peer group
  def group_predicted_loss_ratio
    @peer_group.try(:pred_lr).to_f
  end

  # Atempts to retrive the group_historical_loss_ratio for the peer group. Returns nil if no peer group
  #
  # @return [Integer, nil] the actual_lr value associated to the peer group
  def group_historical_loss_ratio
    @peer_group.try(:actual_lr).to_f
  end

  def peer_group
    if @business_product.name == 'EPLI'
      epli_peer_group
    else
      dno_peer_group
    end
  end

  def epli_peer_group
    employee_total = @company_info.global_employee_total.to_f
    EpliGroup.where(state_groups: state_group,
                    industry_groups: industry_group)
      .where("min_empl <=#{employee_total}  and max_empl >= #{employee_total}")
      .first
  end

  def dno_peer_group
    sales = @current_policy.sales.to_f
    stress_score = @company_info.financial_stress_score.to_f
    DnoGroup.where(industry_groups: industry_group)
      .where("min_sales <= #{sales}  and max_sales >= #{sales}")
      .where("min_f <= #{stress_score}  and max_f >= #{stress_score}")
      .first
  end

  # Retrieve the IndustryGroup associated to the CompanyInfo object
  #
  # @return [String] the industry name of the IndustryGroup associated to the CompanyInfo object
  def industry_group
    IndustryGroup.find_by(business_product: @business_product,
                          business_type: @business_type,
                          sic_code: @company_info.industry_code.to_s[0..2]).industry
  end

  # Child classes must implement this method
  def peer_group
    fail NotImplementedError
  end
end
