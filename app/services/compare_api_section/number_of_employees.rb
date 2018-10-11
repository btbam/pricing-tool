# CompareApiSection::NumberOfEmployees
class CompareApiSection::NumberOfEmployees < CompareApiSection::Base
  def initialize(book, number_of_employees)
    @menu = create_menu
    @menu_select = create_menu_select(number_of_employees)
    super(book, number_of_employees)
  end

  def self.create_menu
    ranges = Compare::NumberEmployeeSm.select_distinct(:range).pluck(:range).sort_by(&:to_i)
    ranges.push(ranges.delete(I18n.t('comparables.missing')))
  end

  def menu
    @menu ||= create_menu
  end

  private

  def create_menu
    self.class.create_menu
  end

  # TODO: :reek:UtilityFunction
  def create_menu_select(number_of_employees)
    number_of_employees ? number_of_employees.range : menu.last
  end
end
