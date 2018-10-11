# DashboardSummarySerializer
class DashboardSummarySerializer < ActiveModel::Serializer
  attributes :duns_number, :name, :industry_code, :global_employee_total,
             :incorporation_date, :start_year, :url, :local_employee_total,
             :hq_state, :phone_number, :is_public, :description, :industry,
             :street_address, :city, :state, :zip_code, :financial_stress,
             :revenue, :employees, :bankruptcy, :credit_score, :expiring_gwp,
             :rate_needed

  def credit_score
    object.credit_score.to_i
  end

  def industry
    object.industry_average_sic_description
  end

  def expiring_gwp
    0
  end

  def financial_stress
    { company: object.financial_stress_score,
      average: object.industry_average_avg_financial_stress }
  end

  def revenue
    { company: object.sales_volume,
      average: object.industry_average_avg_revenue }
  end

  def employees
    { company: object.global_employee_total,
      average: object.industry_average_avg_employees }
  end

  def rate_needed
    { company: 0.1,
      average: 0.2 }
  end

  def bankruptcy
    rating = BankruptcyRating.new(object.bankruptcy_data)
    {
      color: rating.color,
      text: rating.text
    }
  end
end
