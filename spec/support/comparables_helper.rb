RSpec.shared_context 'comparables setup' do
  let!(:example_company) do
    build(:company_info)
  end

  let!(:business_product) { FactoryGirl.create(:business_product) }
  let!(:business_type) { FactoryGirl.create(:business_type) }
  let!(:business_year) { FactoryGirl.create(:business_year) }
  vars = Hash[:loss_experience, :compare_compare_book,
              :industry, :compare_compare_industry,
              :state, :compare_compare_state_sm,
              :size_of_company, :compare_compare_company_size_sale_sm,
              :average_salary, :compare_compare_salary_sale_sm,
              :number_of_employees, :compare_compare_number_employee_sm,
              :financial_health, :compare_compare_financial_health]
  # Make first set of comparables class vars
  vars.each do |klass, factory|
    let!(klass) do
      FactoryGirl.create(factory,
                         business_type: business_type,
                         business_product: business_product,
                         business_year: business_year).compare_type
    end
  end

  # Make second set of comparables class vars
  vars.each do |klass, factory|
    let!((klass.to_s + '_2').to_sym) do
      FactoryGirl.create(factory,
                         business_type: business_type,
                         business_product: business_product,
                         business_year: business_year).compare_type
    end
  end

  let!(:comparables_sections) do
    { 'loss_experience' => loss_experience,
      'industry' => industry,
      'state' => state,
      'size_of_company' => size_of_company,
      'number_of_employees' => number_of_employees,
      'financial_health' => financial_health }
  end
  let!(:comparables_different_values_sections) do
    { 'loss_experience' => loss_experience_2,
      'industry' => industry_2,
      'state' => state_2,
      'size_of_company' => size_of_company_2,
      'number_of_employees' => number_of_employees_2,
      'financial_health' => financial_health_2 }
  end

  before do
    allow(CompanyInfo).to receive(:create_from_es).and_return(example_company)
    example_company.business_product = business_product.name
    example_company.business_type = business_type.name
    allow(IndustryAverage).to receive(:class).and_return(IndustryAverage)
    example_company.industry_code = industry.sic_code
    example_company.state = state.state
    example_company.sales_volume = size_of_company.range_low
    example_company.average_salary = average_salary.range_low
    example_company.global_employee_total = number_of_employees.range_low
    example_company.financial_stress_score_class = financial_health.financial_stress_score.match(/\d/).to_s
    category_name = IndustryAverage.generate_category_name(business_product.name, business_type.name)
    FactoryGirl.create(:industry_average, sic_code: example_company.industry_code,
                                          category: category_name)
  end
end
