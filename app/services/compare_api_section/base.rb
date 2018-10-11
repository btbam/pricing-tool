# CompareApiSection::Base
class CompareApiSection::Base
  include ActiveModel::Serialization

  attr_accessor :target, :overall_book, :loss_ratio, :year, :section,
                :menu, :menu_select, :total_policies, :total_policies_with_claims

  def initialize(book, section)
    @section = section
    @overall_book = book.compare.loss_ratio
    @target = book.target_loss_ratio
    generate_data_from_section if section
  end

  def generate_data_from_section
    @loss_ratio = find_loss_ratio
    @year = find_year
    @total_policies = find_policies
    @total_policies_with_claims = find_policies_with_claims
  end

  def find_loss_ratio
    section.compare.loss_ratio
  end

  def find_year
    section.compare.business_year.name
  end

  def find_policies
    section.compare.num_policies
  end

  def find_policies_with_claims
    section.compare.num_policies_with_positive_claims
  end
end
