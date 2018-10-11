# CompareApiSection::LossExperience
class CompareApiSection::LossExperience < CompareApiSection::Base
  attr_accessor :rate_needed_14, :target_loss_ratio

  def initialize(book)
    @menu = create_menu
    @menu_select = create_menu_select
    @rate_needed_14 = book.rate_needed_14
    @target_loss_ratio = book.target_loss_ratio
    super(book, book)
  end

  def self.create_menu
    Compare.select_distinct(%w(business_product_id business_type_id)).map do |book|
      book.business_product.name + '/' + book.business_type.name
    end
  end

  private

  def create_menu
    self.class.create_menu
  end

  # TODO: :reek:UtilityFunction
  def create_menu_select
    I18n.t('comparables.do_private')
  end
end
