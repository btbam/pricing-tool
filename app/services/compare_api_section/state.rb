# CompareApiSection::State
class CompareApiSection::State < CompareApiSection::Base
  def initialize(book, state)
    @menu = create_menu
    @menu_select = create_menu_select(state)
    super(book, state)
  end

  def self.create_menu
    states = Compare::StateSm.select_distinct(:state).pluck(:state).sort
    states.push(states.delete(I18n.t('comparables.missing')))
  end

  def menu
    @menu ||= create_menu
  end

  private

  def create_menu
    self.class.create_menu
  end

  # TODO: :reek:UtilityFunction
  def create_menu_select(state)
    state ? state.state : menu[0]
  end
end
