# CompareApiSection::FinancialHealth
class CompareApiSection::FinancialHealth < CompareApiSection::Base
  attr_accessor :industry_average, :financial_stress_score

  def initialize(book, financial_health, company_info)
    @menu = {}
    @menu_select = 0
    @industry_average = self.class.generate_industry_average(financial_health, company_info)
    @financial_stress_score = company_info ? company_info.financial_stress_score : nil
    super(book, financial_health)
  end

  def self.generate_industry_average(financial_health, company_info)
    return if !company_info || !financial_health
    compare = financial_health.compare
    industry_average = IndustryAverage.find_by_industry_code_and_category(
                                        company_info.industry_code,
                                        compare.business_product.name,
                                        compare.business_type.name)
                       .first
    industry_average ? industry_average.avg_financial_stress : nil
  end
end
