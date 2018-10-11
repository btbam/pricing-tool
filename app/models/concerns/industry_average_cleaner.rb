# IndustryAverageCleaner
module IndustryAverageCleaner
  extend ActiveSupport::Concern

  include DnbCleaner

  included do
    scope :by_industry_code, ->(industry_code) { where(sic_code: new(sic_code: industry_code).sic_first) }
  end

  def sic_first
    super :sic_code
  end
end
