# CompareApi
class CompareApi
  include ActiveModel::Serialization
  include Carmen

  attr_accessor :include_sections, :book, :loss_experience, :industry, :financial_health,
                :state, :size_of_company, :number_of_employees, :compare

  def initialize(company_info, include_sections = nil)
    @include_sections = include_sections
    @book = self.class.find_book(company_info.business_product.id, company_info.business_type.id)
    @compare = book.compare
    create_compare_sections(company_info)
  end

  def create_compare_sections(company_info)
    @loss_experience = loss_experience_section
    @industry = industry_section(company_info)
    @financial_health = financial_health_section(company_info)
    @state = state_section(company_info)
    @size_of_company = size_of_company_section(company_info)
    @number_of_employees = number_of_employees_section(company_info)
  end

  def self.find_book(business_product_id, business_type_id)
    Compare::Book.joins_compare(business_product_id, business_type_id).first
  end

  private

  def section_excluded?(section)
    include_sections && !include_sections.include?(section)
  end

  def loss_experience_section
    return nil if section_excluded?('loss_experience')
    CompareApiSection::LossExperience.new(book)
  end

  def industry_section(company_info)
    return nil if section_excluded?('industry')
    industry_code = company_info.industry_code || I18n.t('comparables.missing')
    if industry_code
      industry = Compare::Industry.joins_compare(compare.business_product_id,
                                                 compare.business_type_id)
                 .by_industry_code(industry_code)
                 .first
    else
      industry = nil
    end
    CompareApiSection::Industry.new(book, industry)
  end

  # TODO: :reek:UtilityFunction
  def state_lookup(company_info_state)
    country = Country.named('United States')
    state_code = company_info_state.strip
    if state_code.length > 2
      state_code
    else
      country.subregions.coded(state_code).name
    end
  end

  def state_section(company_info)
    return nil if section_excluded?('state')
    current_state = state_lookup(company_info.state)
    state = Compare::StateSm.joins_compare(compare.business_product_id,
                                           compare.business_type_id)
            .where(state: (current_state.presence || I18n.t('comparables.missing')))
            .first
    CompareApiSection::State.new(book, state)
  end

  def size_of_company_section(company_info)
    return nil if section_excluded?('size_of_company')
    size_of_company = Compare::CompanySizeSaleSm.joins_compare(compare.business_product_id,
                                                               compare.business_type_id)
                      .with_range(company_info.sales_volume.to_i)
                      .first
    CompareApiSection::SizeOfCompany.new(book, size_of_company)
  end

  def number_of_employees_section(company_info)
    return nil if section_excluded?('number_of_employees')
    number_of_employees = Compare::NumberEmployeeSm.joins_compare(compare.business_product_id,
                                                                  compare.business_type_id)
                          .with_range(company_info.global_employee_total.to_i)
                          .first
    CompareApiSection::NumberOfEmployees.new(book, number_of_employees)
  end

  def financial_health_section(company_info)
    return nil if section_excluded?('financial_health')
    financial_health = Compare::FinancialHealth.joins_compare(compare.business_product_id,
                                                              compare.business_type_id)
                       .by_financial_stress_score(company_info.financial_stress_score_class)
                       .first
    CompareApiSection::FinancialHealth.new(book, financial_health, company_info)
  end
end
