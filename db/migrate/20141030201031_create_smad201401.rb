class CreateSmad201401 < ActiveRecord::Migration
  def change
    create_table :dnb_smad201401s do |t|
      t.decimal "duns_number"
      t.decimal "arch_dte"
      t.decimal "base_dat"
      t.decimal "d1stbase"
      t.decimal "fsa_dat"
      t.decimal "eaa_dat"
      t.string  "basecat",     limit: 1
      t.string  "history",     limit: 1
      t.string  "conditn",     limit: 1
      t.string  "finance",     limit: 1
      t.string  "moved",       limit: 1
      t.string  "spevnt_i",    limit: 1
      t.string  "forowned",    limit: 1
      t.decimal "worth"
      t.string  "rating",      limit: 3
      t.string  "orating",     limit: 3
      t.decimal "dtrtgchg"
      t.decimal "inq_reg"
      t.string  "comp_typ",    limit: 1
      t.string  "yrcntl",      limit: 4
      t.string  "yrstart",     limit: 4
      t.string  "owns",        limit: 1
      t.string  "debtpos",     limit: 1
      t.string  "tixie",       limit: 1
      t.string  "nixie",       limit: 1
      t.string  "ob_ind",      limit: 1
      t.string  "stop_ind",    limit: 1
      t.string  "status",      limit: 1
      t.decimal "sales"
      t.string  "sales_cd",    limit: 1
      t.decimal "emptotl"
      t.string  "empt_cd",     limit: 1
      t.decimal "emphere"
      t.string  "emph_cd",     limit: 1
      t.string  "subsid",      limit: 1
      t.string  "manuf",       limit: 1
      t.decimal "nbr_sics"
      t.decimal "sic10"
      t.decimal "sic11"
      t.decimal "sic20"
      t.decimal "sic30"
      t.decimal "sic40"
      t.decimal "sic50"
      t.decimal "sic60"
      t.decimal "sicpct1"
      t.decimal "sicpct2"
      t.decimal "sicpct3"
      t.decimal "sicpct4"
      t.decimal "sicpct5"
      t.decimal "sicpct6"
      t.string  "state_ph",    limit: 2
      t.string  "state",       limit: 2
      t.string  "zip5",        limit: 5
      t.decimal "smsa_db"
      t.decimal "smsa_fps"
      t.decimal "stat_fps"
      t.decimal "city_cd"
      t.decimal "cnty_db"
      t.string  "multaddr",    limit: 1
      t.string  "location",    limit: 1
      t.string  "import",      limit: 1
      t.string  "publics",     limit: 1
      t.string  "dmdisbus",    limit: 1
      t.string  "minor",       limit: 1
      t.string  "woman",       limit: 1
      t.string  "prescrn",     limit: 1
      t.string  "rec_type",    limit: 1
      t.string  "trans_cd",    limit: 1
      t.string  "dlasrpt",     limit: 8
      t.string  "cottage",     limit: 1
      t.string  "mrc1",        limit: 4
      t.string  "mrc2",        limit: 4
      t.string  "mrc3",        limit: 4
      t.string  "mrc4",        limit: 4
      t.string  "mrc5",        limit: 4
      t.string  "mrc6",        limit: 4
      t.string  "gendercd",    limit: 1
      t.string  "pop_cd",      limit: 1
      t.decimal "ultdunsd"
      t.decimal "hdq_duns"
      t.decimal "par_duns"
      t.decimal "family"
      t.string  "territor",    limit: 1
      t.decimal "nbraccts"
      t.decimal "sqfoot"
      t.string  "sqfoot_i",    limit: 1
      t.string  "sale1_cd",    limit: 1
      t.string  "sale4_cd",    limit: 1
      t.string  "sale6_cd",    limit: 1
      t.string  "empl1_cd",    limit: 1
      t.string  "empl4_cd",    limit: 1
      t.string  "empl6_cd",    limit: 1
      t.decimal "basyrsal"
      t.decimal "basyremp"
      t.decimal "sale4yr"
      t.decimal "empl4yr"
      t.decimal "sale6yr"
      t.decimal "empl6yr"
      t.string  "hl_new",      limit: 1
      t.string  "hl_owner",    limit: 1
      t.string  "hl_ceo",      limit: 1
      t.string  "hl_name",     limit: 1
      t.string  "hl_addr",     limit: 1
      t.string  "hl_phone",    limit: 1
      t.string  "bnkrpt",      limit: 1
      t.string  "bkcy_dat",    limit: 8
      t.decimal "suits"
      t.string  "suitnull",    limit: 1
      t.decimal "vsuits_o"
      t.decimal "liens"
      t.string  "liennull",    limit: 1
      t.decimal "vliens_o"
      t.decimal "judgs"
      t.string  "judgnull",    limit: 1
      t.decimal "vjudgs_o"
      t.decimal "fings"
      t.decimal "fing_3yr"
      t.decimal "fing_5yr"
      t.string  "incorpdt",    limit: 8
      t.decimal "pay_refs"
      t.decimal "bnk_refs"
      t.decimal "pay_exps"
      t.decimal "bnk_exps"
      t.decimal "pdx1"
      t.decimal "pdx2"
      t.decimal "pdx3"
      t.decimal "pdx4"
      t.decimal "pdx5"
      t.decimal "pdx6"
      t.decimal "pdx7"
      t.decimal "pdx8"
      t.decimal "pdx9"
      t.decimal "pdx10"
      t.decimal "pdx11"
      t.decimal "pdx12"
      t.decimal "slow"
      t.decimal "neg"
      t.decimal "sum_hc"
      t.decimal "max_hc"
      t.decimal "avg_hc"
      t.string  "hc_flag",     limit: 1
      t.decimal "amt_pdue"
      t.decimal "nbr_pdue"
      t.decimal "urls"
      t.decimal "urls_reg"
      t.decimal "urls_aff"
      t.decimal "urlsnodm"
      t.decimal "urls_dom"
      t.decimal "urlscons"
      t.decimal "urlslive"
      t.decimal "urlreglv"
      t.decimal "urlafflv"
      t.decimal "urlsscr"
      t.decimal "urlsmeta"
      t.decimal "urlshext"
      t.decimal "urlshint"
      t.decimal "urlsmext"
      t.decimal "urlsmint"
      t.string  "frnchind",    limit: 1
      t.string  "geo_acc",     limit: 1
      t.string  "lat_sign",    limit: 1
      t.decimal "latitude"
      t.string  "lon_sign",    limit: 1
      t.decimal "longitud"
      t.decimal "geocode"
      t.string  "fsa_typ",     limit: 1
      t.string  "eaa_typ",     limit: 1
      t.decimal "inq_cs"
      t.decimal "phone"
      t.string  "in_date",     limit: 1
      t.decimal "pay_used"
      t.decimal "satis"
      t.decimal "exp_30"
      t.decimal "exp_60"
      t.decimal "exp_90"
      t.decimal "exp_120"
      t.decimal "exp_180"
      t.decimal "exp_999"
      t.decimal "owed30"
      t.decimal "paynorm"
      t.decimal "owed30_act"
      t.string  "filler1",     limit: 23
    end
  end
end
