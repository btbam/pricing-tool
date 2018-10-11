# CompanyInfo
class CompanyInfo < ActiveRecord::Base
  include CompanyInfoCleaner
  include CompanyInfoElasticHelper
  include DatabaseHelper

  attr_accessor :name, :industry, :address, :city, :state, :zip_code, :industry_code, :street_address, :average_salary,
                :sales_volume, :tree_pos, :global_employee_total, :business_product, :business_type

  # Associations
  belongs_to :customer, primary_key: :duns_number, foreign_key: :duns_number
  has_many :policies, primary_key: :duns_number, foreign_key: :duns_number
  has_many :user_histories, primary_key: :duns_number, foreign_key: :duns_number

  # Delegates
  delegate :sic_description, :avg_financial_stress, :avg_revenue,
           :avg_employees, to: :industry_average, prefix: true, allow_nil: true

  # Scopes
  scope :by_duns, ->(duns) { where(duns_number: duns).order(as_of_date: :desc) }
  scope :by_date, ->(date) { where(as_of_date: date) }
  scope :time_ago, ->(time_ago) { where('as_of_date >= :time_ago', time_ago: time_ago) }

  # Retrieves the associated IndustryAverage object
  #
  # @return [IndustryAverage, nil] the associated IndustryAverage object
  def industry_average
    return nil unless duns_number
    repo = CompanyRepository.new
    result = repo.find_by_duns(duns_number)
    IndustryAverage.where(sic_code: result.sic_code_first).first if result
  end

  # Finds and sets the Business::Product association
  def business_product=(product_name)
    @business_product = Business::Product.find_by_name(product_name.upcase)
  end

  # Finds and sets the Business::Type association
  def business_type=(type)
    @business_type = Business::Type.find_by_name(type.upcase)
  end

  # Retrieves the most recent associated D&O policy
  #
  # @return [Policy] the most recent associated D&O policy
  def current_dno_policy
    policies.where(business_product: Business::Product.find_by(name: 'DO')).order(policy_year: :desc).first
  end

  # Retrieves the most recent associated EPLI policy
  #
  # @return [Policy] the most recent associated EPLI policy
  def current_epli_policy
    policies.where(business_product: Business::Product.find_by(name: 'EPLI')).order(policy_year: :desc).first
  end
end
