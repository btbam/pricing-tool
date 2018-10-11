# CompareApiSection::SizeOfCompany
class CompareApiSection::SizeOfCompany < CompareApiSection::Base
  def initialize(book, size_of_company)
    @menu = create_menu
    @menu_select = create_menu_select(size_of_company)
    super(book, size_of_company)
  end

  def self.create_menu
    ranges = Compare::CompanySizeSaleSm.select_distinct(:range).pluck(:range).sort_by(&:to_f)
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
  def create_menu_select(size_of_company)
    size_of_company ? size_of_company.range : menu[0]
  end
end
