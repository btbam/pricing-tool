# RenewalBusiness
class RenewalBusiness < EdwRecord
  self.table_name = 'TSCI_DIRECTORS_OFFICERS_RATING'
  self.table_name = "EDWOFFSHORE.#{table_name}" unless Rails.env.test?

  scope :by_duns_dno, ->(duns) { where(duns_number: duns, lob: 'DO') }
  scope :by_duns_epli, ->(duns) { where(duns_number: duns, lob: 'EPLI') }

  def self.find_by_duns_dno(duns)
    by_duns_dno(duns).limit(1).first
  end

  def self.find_by_duns_epli(duns)
    by_duns_epli(duns).limit(1).first
  end

  alias_attribute :policy_number, :policy_no
  alias_attribute :effective_date, :pol_eff_dt
  alias_attribute :expiration_date, :pol_exp_dt
  alias_attribute :final_premium, :final_premium_am
  alias_attribute :industry, :industry_rt
  alias_attribute :recommended_industry, :recommended_industry_rt
  alias_attribute :aggregate_limit, :agg_limit_am
  alias_attribute :occurrence_limit, :occ_limit_am
  alias_attribute :dnb_credit_score_factor, :debit_credit_score_rt
  alias_attribute :punitive_damages, :punitive_damages_rt
  alias_attribute :entity_nonentity_coverage, :entity_nonentity_rt
  alias_attribute :management_experience_qualifications, :mgmt_experience_qual_rt
  alias_attribute :litigation_factor, :litigation_rt
  alias_attribute :litigation_ex_dno, :do_corp_litigation_rt
  alias_attribute :litigation, :corp_litigation_rt
  alias_attribute :revenue_asset_irregularities, :revenue_asset_irreg_rt
  alias_attribute :special_coverage, :speciality_coverage_rt
  alias_attribute :private_company, :pvt_comp_modifier_rt
  alias_attribute :dno_percent_private_stock, :do_pvt_stock_rt
  alias_attribute :nonentity_epli, :non_entity_epli_rt
  alias_attribute :private_placement, :pvt_placement_rt
  alias_attribute :board_auditor, :board_auditor_rt
  alias_attribute :claims_frequency_last_year, :claim_frequency_rt
  alias_attribute :claims_severity_last_year, :claims_severity_rt
  alias_attribute :duns_number, :duns_no
  alias_attribute :prior_acts, :prior_acts_rt
  alias_attribute :retention, :retention_am
  alias_attribute :esop_ownership, :esop_ownership_rt
  alias_attribute :ipo, :initial_public_offrng_rt
  alias_attribute :public_debt, :public_debt_rt
  alias_attribute :lob, :lob_cd

  def business_product
    Business::Product.find_by_name(lob) if lob
  end

  def business_type
    Business::Type.find_by_name('PRIVATE')
  end

  def mergers_and_acquisitions
    1
  end

  def policy
    @policy ||= Policy.where(policy_number: policy_number.to_i).order(:policy_year).first
  end

  def limit
    aggregate_limit
  end
end
