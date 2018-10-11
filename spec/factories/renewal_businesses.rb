FactoryGirl.define do
  factory :renewal_business do
    duns_no { Faker::Company.duns_number.tr('^0-9', '').to_i }
    insured_nm { Faker::Company.name.upcase }
    total_assets_am { Faker::Number.positive(1_000_000, 9_999_999_999) }
    agg_limit_am { 5_000_000 }
    retention_am { 25_000 }
    industry_rt { Faker::Number.between(1, 1.3) }
    recommended_industry_rt { Faker::Number.between(1, 1.3) }
    years_in_business_ds { 'More than 5 Years' }
    years_in_business_rt { 1 }
    mgmt_experience_qual_rt { Faker::Number.between(1, 1.3) }
    litigation_rt { Faker::Number.between(1, 1.3) }
    do_corp_litigation_rt { Faker::Number.between(1, 1.3) }
    corp_litigation_rt { Faker::Number.between(1, 1.3) }
    entity_nonentity_rt { Faker::Number.between(0.8, 1) }
    revenue_asset_irreg_rt { Faker::Number.between(1, 1.75) }
    prior_acts_rt { Faker::Number.between(0.7, 1) }
    punitive_damages_rt { Faker::Number.between(1, 1.4) }
    speciality_coverage_rt { Faker::Number.between(1, 1.4) }
    pvt_comp_modifier_rt { Faker::Number.between(1, 1.3) }
    do_pvt_stock_rt { Faker::Number.between(0.8, 1) }
    esop_ownership_rt { Faker::Number.between(1, 1.5) }
    initial_public_offrng_rt { Faker::Number.between(1, 1.3) }
    public_debt_rt { Faker::Number.between(1, 1.3) }
    non_entity_epli_rt { Faker::Number.between(1, 1.3) }
    pvt_placement_rt { Faker::Number.between(1, 1.3) }
    board_auditor_rt { Faker::Number.between(1, 1.3) }
    final_premium_am { 20_225 }
    submission_no { 15_198_376 }
    lob_cd { 'DO' }
    policy_no { 13_546_217 }
    pol_eff_dt { 2014 }
    pol_exp_dt { 2015 }
    off_manual_rt { Faker::Number.between(1, 1.3) }
    exprd_policy_no { 10_367_878 }
    exprd_pol_eff_dt { 2013 }
    exprd_pol_exp_dt { 2014 }
    exprd_pol_premium_am { 16_059 }
    exprd_pol_off_manual_rt { Faker::Number.between(1, 1.3) }
    new_renewal_cd { 'R' }
    exprd_rating_plan_cd { nil }
    stat_plan_cd { 'DO_001p' }
    corp_structure_cd { 'PVT' }
    rating_class_ds { nil }
    rating_mode_ds { 'Comprehensive Rating' }
    occ_limit_am { 5_000_000 }
    debit_credit_score_no { nil }
    debit_credit_score_rt { Faker::Number.between(1, 1.3) }
    epli_covg_type_ds { 'Full EPLI Coverage Granted ( Priced Separately )' }
    exprd_corp_assets_am { 79_225_872 }
    exprd_occ_limit_am { 5_000_000 }
    exprd_agg_limit_am { 5_000_000 }
    exprd_shared_epli_limit_am { Faker::Number.between(1, 1.3) }
    exprd_retention_am { 25_000 }
    exprd_years_in_business_ds { 'More than 5 Years' }
    exprd_prior_acts_ds { Faker::Number.between(0.7, 1) }
    exprd_punitive_damages_ds { 'Selected but NOT Insurable in Domicile State' }
    exprd_entity_nonentity_ds { 'Not Applicable' }
    exprd_shared_limit_rt { Faker::Number.between(1, 1.3) }
    exprd_base_premium_am { 7107.4718 }
    claims_severity_rt { Faker::Number.between(1, 1.3) }
    claim_frequency_rt { Faker::Number.between(1, 1.3) }
  end
end
