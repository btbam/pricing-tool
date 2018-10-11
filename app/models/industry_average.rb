# IndustryAverage
class IndustryAverage < ActiveRecord::Base
  include IndustryAverageCleaner

  scope :by_category,
        lambda { |product_name, type_name|
          where(category: IndustryAverage.generate_category_name(product_name, type_name))
        }

  def self.find_by_industry_code_and_category(industry_code, business_product_name, business_type_name)
    by_industry_code(industry_code).by_category(business_product_name, business_type_name)
  end

  def self.generate_category_name(product, type)
    type_down = type.downcase
    type = type_down == 'private' ? type_down.titleize : type.upcase
    "#{type}_#{product.upcase}"
  end

  # Although not used in the codebase, this method is handy for data verification
  def company_infos
    repo = CompanyRepository.new
    results = repo.search(query: { match: { sic_code_first: sic_first } })
    CompanyInfo.where(duns_number: results.map(&:duns_number))
  end
end
