module Compare::Base
  extend ActiveSupport::Concern
  include CompareHelper

  # TODO: move to a concern (see pricing-tool-189)
  def range_low_or_nil
    return nil unless respond_to?(:range) && respond_to?(:range_low)
    range_low unless range == I18n.t('comparables.missing')
  end

  included do
    has_one :compare, as: :compare_type, dependent: :destroy

    scope :join_compare, ->() { joins(:compare) }
    scope :by_business_type, ->(type_id) { where(compares: { business_type_id: type_id }) }
    scope :by_business_product, ->(product_id) { where(compares: { business_product_id: product_id }) }
    scope :range_low, ->(target) { where('range_low <= :target', target: target) }
    scope :range_high, ->(target) { where('range_high >= :target', target: target) }
  end

  module ClassMethods
    def table_name_prefix
      'compare_'
    end

    def joins_compare(business_product_id, business_type_id)
      join_compare.by_business_product(business_product_id).by_business_type(business_type_id)
    end

    def with_range(target)
      if target
        range_low(target).range_high(target)
      else
        where(range: I18n.t('comparables.missing'))
      end
    end

    def from_range(range_low, range_high)
      compare_size = where(range_low: range_low)
      compare_size = compare_size.where(range_high: range_high) if range_high > 0
      compare_size.first
    end
  end
end
