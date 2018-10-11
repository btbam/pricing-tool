class Policy < ActiveRecord::Base
  # Associations
  belongs_to :business_product, class_name: 'Business::Product'
  belongs_to :business_type, class_name: 'Business::Type'

  attr_writer :name

  # Return the 40 nearest policies to the current policy PLUS the current policy based on params
  #
  # @param sic_code [Integer] the sic_code to find similar policies for
  # @param business_product_id [Integer] the value representing the associated Business::Product
  # @param sales [Integer] the value to find the difference against
  # @return [Array<Policy>] the array of comparable policies
  def self.nearest_forty(sic_code, business_product_id, sales, duns_number)
    similar_policies = Policy.where(sic_00_code: sic_code,
                                    business_product_id: business_product_id,
                                    policy_year: 2014) # Policy Year should be updated when we get new data
                       .where('duns_number != ?', duns_number)
                       .eager_load(:business_product, :business_type)

    comp_policies = comparable_policies(similar_policies, sales)

    policies_with_name(comp_policies[0..40].sort_by(&:sales))
  end

  # Return the array of most recent policies sorted by the absolute difference in sales
  #
  # @param similar_policies [Array<Policy>] the array of policies to be limited and sorted
  # @param sales [Integer] the value to find the difference against
  # @return [Array<Policy>] the array of comparable policies
  # :reek:NestedIterators
  def self.comparable_policies(similar_policies, sales)
    [].tap do |cp|
      similar_policies.map(&:duns_number).uniq.each do |duns|
        policies = similar_policies.select { |policy| policy.duns_number == duns }
        cp << policies.max_by(&:policy_year)
      end
      cp.sort_by { |policy| (sales.to_i - policy.sales).abs }
    end
  end

  # Return the array of policies after finding and setting their name from ES
  #
  # @param policies [Array<Policy>] the array of policies to find names for
  # @return [Array<Policy>] the array of policeis after setting the name
  # :reek:NestedIterators
  def self.policies_with_name(policies)
    CompanyInfo.es_with_name(policies)
  end

  # Returns the name of the associated Business::Product
  #
  # @return [String] the name of the associated Business::Product
  def product
    business_product.name if business_product
  end

  # Returns the name of the associated Business::Type
  #
  # @return [String] the name of the associated Business::Type
  def type
    business_type.name if business_type
  end

  # Returns the associated CompanyInfo object
  #
  # @return [CompanyInfo] the associated CompanyInfo object
  def company_info
    @company_info ||= CompanyInfo.create_from_es(duns: duns_number)
  end

  # Returns the name of the associated CompanyInfo object from ES if not already set
  #
  # @return [String] the name of the associated CompanyInfo object
  def name
    @name ||= CompanyRepository.new.find_by_duns(duns_number).name
  end
end
