# CompareApiSection::Industry
class CompareApiSection::Industry < CompareApiSection::Base
  def initialize(book, industry)
    @menu = create_menu
    @menu_select = create_menu_select(industry)
    super(book, industry)
  end

  def self.create_menu
    industries = Compare::Industry.select_distinct(:name).pluck(:name).sort
    industries.push(industries.delete(I18n.t('comparables.n_a')))
  end

  def menu
    @menu ||= create_menu
  end

  private

  def create_menu
    self.class.create_menu
  end

  # TODO: :reek:UtilityFunction
  def create_menu_select(industry)
    industry ? industry.name : menu[0]
  end
end
