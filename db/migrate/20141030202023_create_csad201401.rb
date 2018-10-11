class CreateCsad201401 < ActiveRecord::Migration
  def change
    create_table :dnb_csad201401s do |t|
      t.decimal  "duns_number"
      t.string   "datepll",          limit: 5
      t.decimal  "nixie"
      t.string   "date_ind",         limit: 1
      t.string   "basecat",          limit: 1
      t.decimal  "control"
      t.string   "crating",          limit: 3
      t.string   "orating",          limit: 3
      t.string   "history",          limit: 1
      t.string   "cond_ind",         limit: 1
      t.decimal  "ob_ind"
      t.string   "finance",          limit: 1
      t.decimal  "moved"
      t.decimal  "fire"
      t.decimal  "burglry"
      t.decimal  "criminal"
      t.decimal  "sub_ind"
      t.decimal  "totempl"
      t.decimal  "emplhere"
      t.decimal  "sales"
      t.decimal  "networth"
      t.decimal  "stmt_ind"
      t.string   "stmt_typ",         limit: 1
      t.string   "state_db",         limit: 2
      t.decimal  "zip_code"
      t.decimal  "smsacode"
      t.decimal  "stop_ind"
      t.string   "date_ob",          limit: 8
      t.datetime "stmtdate"
      t.string   "inqcs",            limit: 5
      t.decimal  "inqreg"
      t.string   "eaa_typ",          limit: 1
      t.datetime "eaadate"
      t.decimal  "hq_duns_number"
      t.decimal  "telephone_number"
      t.string   "tixie",            limit: 1
      t.integer  "paydex1",          limit: 3, precision: 3, scale: 0
      t.integer  "paydex2",          limit: 3, precision: 3, scale: 0
      t.integer  "paydex3",          limit: 3, precision: 3, scale: 0
      t.integer  "paydex4",          limit: 3, precision: 3, scale: 0
      t.integer  "paydex5",          limit: 3, precision: 3, scale: 0
      t.integer  "paydex6",          limit: 3, precision: 3, scale: 0
      t.integer  "paydex7",          limit: 3, precision: 3, scale: 0
      t.integer  "paydex8",          limit: 3, precision: 3, scale: 0
      t.integer  "paydex9",          limit: 3, precision: 3, scale: 0
      t.integer  "paydex10",         limit: 3, precision: 3, scale: 0
      t.integer  "paydex11",         limit: 3, precision: 3, scale: 0
      t.integer  "paydex12",         limit: 3, precision: 3, scale: 0
      t.integer  "paydex13",         limit: 3, precision: 3, scale: 0
      t.integer  "paydex14",         limit: 3, precision: 3, scale: 0
      t.integer  "paydex15",         limit: 3, precision: 3, scale: 0
      t.integer  "paydex16",         limit: 3, precision: 3, scale: 0
      t.integer  "paydex17",         limit: 3, precision: 3, scale: 0
      t.integer  "paydex18",         limit: 3, precision: 3, scale: 0
      t.integer  "paydex19",         limit: 3, precision: 3, scale: 0
      t.integer  "paydex20",         limit: 3, precision: 3, scale: 0
      t.integer  "paydex21",         limit: 3, precision: 3, scale: 0
      t.integer  "paydex22",         limit: 3, precision: 3, scale: 0
      t.integer  "paydex23",         limit: 3, precision: 3, scale: 0
      t.integer  "paydex24",         limit: 3, precision: 3, scale: 0
      t.string   "filler1",          limit: 5
      t.string   "filler2",          limit: 5
      t.string   "filler3",          limit: 5
      t.string   "filler4",          limit: 5
      t.string   "filler5",          limit: 5
      t.string   "filler6",          limit: 5
      t.string   "filler7",          limit: 5
      t.decimal  "hicdtavg"
      t.decimal  "hicdtmax"
      t.decimal  "npayexp"
      t.decimal  "npayexpp"
      t.decimal  "payexp_s"
      t.decimal  "payexp_n"
      t.decimal  "pexp_s_n"
      t.decimal  "pexp_sat"
      t.decimal  "nbr_pdue"
      t.decimal  "amt_pdue"
      t.decimal  "pexp_30"
      t.decimal  "pexp_60"
      t.decimal  "pexp_90"
      t.decimal  "pexp_120"
      t.decimal  "pexp_180"
      t.decimal  "pexp_999"
      t.decimal  "amtdue30"
      t.decimal  "payref"
      t.datetime "basymd"
      t.decimal  "yrstart"
      t.string   "comptype",         limit: 1
      t.decimal  "sic4"
      t.decimal  "sic_sec1"
      t.decimal  "sic_sec2"
      t.decimal  "sic_sec3"
      t.decimal  "sic_sec4"
      t.decimal  "sic_sec5"
      t.decimal  "owns_ind"
      t.decimal  "rent_ind"
      t.decimal  "opresind"
      t.decimal  "bnkrpt"
      t.decimal  "dbt_ind"
      t.datetime "bnkrptdt"
      t.decimal  "liens"
      t.decimal  "suits"
      t.decimal  "judgmnts"
      t.decimal  "uccfilng"
      t.decimal  "cscore"
      t.decimal  "cpct"
      t.decimal  "cpoints"
      t.decimal  "fscore"
      t.decimal  "fpct"
      t.decimal  "paynorm"
      t.decimal  "fspoints"
      t.decimal  "bd_ind"
      t.datetime "date_bd"
      t.string   "import",           limit: 1
      t.string   "pubpvt",           limit: 1
      t.string   "loc_ind",          limit: 1
      t.datetime "fbasedat"
      t.decimal  "dsuits"
      t.decimal  "djudgmnt"
      t.decimal  "dliens"
      t.decimal  "corptype"
      t.decimal  "pex_sl1"
      t.decimal  "pex_ng1"
      t.decimal  "pex_sn1"
      t.decimal  "pexsat1"
      t.decimal  "pexcur1"
      t.decimal  "pex30x1"
      t.decimal  "pex60x1"
      t.decimal  "pex90x1"
      t.decimal  "pex1201"
      t.decimal  "pex1801"
      t.decimal  "pex9991"
      t.decimal  "pexoth1"
      t.decimal  "pexnpm1"
      t.decimal  "pex_pm1"
      t.decimal  "totdoll1"
      t.decimal  "slodoll1"
      t.decimal  "negdoll1"
      t.decimal  "sn_doll1"
      t.decimal  "satdoll1"
      t.decimal  "dollcur1"
      t.decimal  "doll_301"
      t.decimal  "doll_601"
      t.decimal  "doll_901"
      t.decimal  "doll_1201"
      t.decimal  "doll_1801"
      t.decimal  "doll_9991"
      t.decimal  "dolloth1"
      t.decimal  "dollnpm1"
      t.decimal  "doll_pm1"
    end
  end
end
