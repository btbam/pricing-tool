# DnbCleaner
module DnbCleaner
  extend ActiveSupport::Concern

  def sic_first(field)
    value = send(field.to_sym).to_s
    return nil if value == ''
    value.size == 3 ? value[0] : value[0..1]
  end
end
