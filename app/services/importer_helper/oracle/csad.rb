# ImporterHelper::Oracle::Csad
class ImporterHelper::Oracle::Csad < ImporterHelper::Oracle
  def convert_fields
    {
      duns_number: :duns_number,
      yrstart: :start_year,
      fspoints: :financial_stress_score,
      cscore: :credit_score_class,
      cpoints: :credit_score,
      fscore: :financial_stress_score_class,
      ob_ind: :out_of_business,
      cond_ind: :condition,
      telephone_number: :phone_number,
      networth: :total_net_worth,
      pubpvt: :is_public,
      as_of_dt: :as_of_date
    }
  end

  def converters
    {
      duns_number: ->(duns_number) { duns_number.to_d.floor },
      yrstart: ->(yrstart) { yrstart.to_i },
      fspoints: ->(fspoints) { if_nil(fspoints) { fspoints.to_d } },
      cscore: ->(cscore) { if_nil(cscore) { cscore.to_i } },
      cpoints: ->(cpoints) { if_nil(cpoints) { cpoints.to_d } },
      fscore: ->(fscore) { if_nil(fscore) { fscore.to_i } },
      ob_ind: ->(ob_ind) { if_true(ob_ind.floor.to_s, '1') }, # maybe from SMAD?
      cond_ind: ->(cond_ind) { determine_condition(cond_ind) }, # SMAD conditn?
      telephone_number: ->(telephone_number) { if_nil(telephone_number) { telephone_number.to_d.floor } }, # SMAD phone?
      networth: ->(networth) { if_nil(networth) { networth.to_d } }, # SMAD worth?
      pubpvt: ->(pubpvt) { if_true(pubpvt, 's') }, # SMAD public?
      as_of_dt: ->(as_of_dt) { as_of_dt }
    }
  end

  def select_columns
    %w(
      duns_number
      yrstart
      fspoints
      ob_ind
      cscore
      cpoints
      fscore
      cond_ind
      telephone_number
      networth
      pubpvt
      as_of_dt
    )
  end
end
