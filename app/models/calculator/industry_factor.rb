class Calculator::IndustryFactor < ActiveRecord::Base
  scope :by_sic_code_dno, lambda { |sic_code|
    where(sic_code: sic_code,
          business_product_id: Business::Product.find_by_name('DO').try(:id))
  }

  scope :by_sic_code_epli, lambda { |sic_code|
    where(sic_code: sic_code,
          business_product_id: Business::Product.find_by_name('EPLI').try(:id))
  }

  scope :by_ca, ->(ca_flag) { where(ca: ca_flag) }

  def self.find_by_sic_code_dno(sic_code)
    by_sic_code_dno(sic_code).first
  end

  def self.find_by_sic_code_epli(sic_code, ca_flag = nil)
    by_sic_code_epli(sic_code).by_ca(ca_flag).first
  end
end
