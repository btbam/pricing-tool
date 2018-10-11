class Calculator::FinancialFactor < ActiveRecord::Base
  scope :by_dnb_dno, lambda { |dnb|
    where(dnb_financial_distress_score: dnb,
          business_product_id: Business::Product.find_by_name('DO').try(:id))
  }

  scope :by_dnb_epli, lambda { |dnb|
    where(dnb_financial_distress_score: dnb,
          business_product_id: Business::Product.find_by_name('EPLI').try(:id))
  }

  def self.find_by_dnb_dno(dnb)
    by_dnb_dno(dnb).first
  end

  def self.find_by_dnb_epli(dnb)
    by_dnb_epli(dnb).first
  end
end
