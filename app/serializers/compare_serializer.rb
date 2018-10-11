# CompareSerializer
class CompareSerializer < ActiveModel::Serializer
  self.root = false

  attributes :industry, :loss_experience, :state, :size_of_company,
             :number_of_employees, :financial_health

  def loss_experience
    CompareSectionLossExperienceSerializer.new(object.loss_experience)
  end

  def industry
    CompareSectionSerializer.new(object.industry)
  end

  def financial_health
    CompareSectionFinancialHealthSerializer.new(object.financial_health)
  end

  def state
    CompareSectionSerializer.new(object.state)
  end

  def size_of_company
    CompareSectionSerializer.new(object.size_of_company)
  end

  def number_of_employees
    CompareSectionSerializer.new(object.number_of_employees)
  end
end
