# ImporterHelper::Oracle::Smad
class ImporterHelper::Oracle::Smad < ImporterHelper::Oracle
  def convert_fields
    {
      duns_number: :duns_number,
      incorpdt: :incorporation_date,
      base_dat: :dnb_last_updated,
      sales: :sales_volume,
      dmdisbus: :small_business,
      emphere: :local_employee_total,
      emptotl: :global_employee_total,
      state_ph: :hq_state,
      as_of_dt: :as_of_date
    }
  end

  def converters
    {
      duns_number: ->(duns_number) { duns_number.to_d.floor },
      incorpdt: ->(incorpdt) { string_to_date(incorpdt) },
      base_dat: ->(base_dat) { string_to_date(base_dat) },
      sales: ->(sales) { sales.to_d }, # maybe from CSAD?
      dmdisbus: ->(dmdisbus) { if_true(dmdisbus, 'y') },
      emphere: ->(emphere) { emphere.to_d.floor }, # CSAD emplhere?
      emptotl: ->(emptotl) { if_nil(emptotl) { emptotl.to_d.floor } }, # CSAD totempl?
      state_ph: ->(state_ph) { state_ph },
      as_of_dt: ->(as_of_dt) { as_of_dt }
    }
  end

  def select_columns
    %w(duns_number incorpdt base_dat sales dmdisbus emphere state_ph emptotl as_of_dt)
  end
end
