# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  create_table "dnb_csad_200411", id: false, force: true do |t|
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

  create_table "dnb_csad_200501", id: false, force: true do |t|
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

  create_table "dnb_csad_200507", id: false, force: true do |t|
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

  create_table "dnb_csad_200601", id: false, force: true do |t|
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

  create_table "dnb_csad_200607", id: false, force: true do |t|
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

  create_table "dnb_csad_200701", id: false, force: true do |t|
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

  create_table "dnb_csad_200707", id: false, force: true do |t|
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

  create_table "dnb_csad_200801", id: false, force: true do |t|
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

  create_table "dnb_csad_200807", id: false, force: true do |t|
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

  create_table "dnb_csad_200901", id: false, force: true do |t|
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

  create_table "dnb_csad_200907", id: false, force: true do |t|
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

  create_table "dnb_csad_201001", id: false, force: true do |t|
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

  create_table "dnb_csad_201007", id: false, force: true do |t|
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

  create_table "dnb_csad_201101", id: false, force: true do |t|
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

  create_table "dnb_csad_201107", id: false, force: true do |t|
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

  create_table "dnb_csad_201201", id: false, force: true do |t|
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

  create_table "dnb_csad_201207", id: false, force: true do |t|
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

  create_table "dnb_csad_201301", id: false, force: true do |t|
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

  create_table "dnb_csad_201307", id: false, force: true do |t|
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

  create_table "dnb_csad_201401", id: false, force: true do |t|
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

  create_table "dnb_smad_200411", id: false, force: true do |t|
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

  add_index "dnb_smad_200411", ["duns_number"], name: "idx_smad_200411", unique: true, tablespace: "bgts_data_team"

  create_table "dnb_smad_200501", id: false, force: true do |t|
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

  add_index "dnb_smad_200501", ["duns_number"], name: "idx_smad_200501", unique: true, tablespace: "bgts_data_team"

  create_table "dnb_smad_200507", id: false, force: true do |t|
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

  add_index "dnb_smad_200507", ["duns_number"], name: "idx_smad_200507", unique: true, tablespace: "bgts_data_team"

  create_table "dnb_smad_200601", id: false, force: true do |t|
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

  add_index "dnb_smad_200601", ["duns_number"], name: "idx_smad_200601", unique: true, tablespace: "bgts_data_team"

  create_table "dnb_smad_200607", id: false, force: true do |t|
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

  add_index "dnb_smad_200607", ["duns_number"], name: "idx_smad_200607", unique: true, tablespace: "bgts_data_team"

  create_table "dnb_smad_200701", id: false, force: true do |t|
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

  add_index "dnb_smad_200701", ["duns_number"], name: "idx_smad_200701", unique: true, tablespace: "bgts_data_team"

  create_table "dnb_smad_200707", id: false, force: true do |t|
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

  add_index "dnb_smad_200707", ["duns_number"], name: "idx_smad_200707", unique: true, tablespace: "bgts_data_team"

  create_table "dnb_smad_200801", id: false, force: true do |t|
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

  add_index "dnb_smad_200801", ["duns_number"], name: "idx_smad_200801", unique: true, tablespace: "bgts_data_team"

  create_table "dnb_smad_200807", id: false, force: true do |t|
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

  add_index "dnb_smad_200807", ["duns_number"], name: "idx_smad_200807", unique: true, tablespace: "bgts_data_team"

  create_table "dnb_smad_200901", id: false, force: true do |t|
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

  add_index "dnb_smad_200901", ["duns_number"], name: "idx_smad_200901", unique: true, tablespace: "bgts_data_team"

  create_table "dnb_smad_200907", id: false, force: true do |t|
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

  add_index "dnb_smad_200907", ["duns_number"], name: "idx_smad_200907", unique: true, tablespace: "bgts_data_team"

  create_table "dnb_smad_201001", id: false, force: true do |t|
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

  add_index "dnb_smad_201001", ["duns_number"], name: "idx_smad_201001", unique: true, tablespace: "bgts_data_team"

  create_table "dnb_smad_201007", id: false, force: true do |t|
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

  add_index "dnb_smad_201007", ["duns_number"], name: "idx_smad_201007", unique: true, tablespace: "bgts_data_team"

  create_table "dnb_smad_201101", id: false, force: true do |t|
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

  add_index "dnb_smad_201101", ["duns_number"], name: "idx_smad_201101", unique: true, tablespace: "bgts_data_team"

  create_table "dnb_smad_201107", id: false, force: true do |t|
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

  add_index "dnb_smad_201107", ["duns_number"], name: "idx_smad_201107", unique: true, tablespace: "bgts_data_team"

  create_table "dnb_smad_201201", id: false, force: true do |t|
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

  add_index "dnb_smad_201201", ["duns_number"], name: "idx_smad_201201", unique: true, tablespace: "bgts_data_team"

  create_table "dnb_smad_201207", id: false, force: true do |t|
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

  add_index "dnb_smad_201207", ["duns_number"], name: "idx_smad_201207", unique: true, tablespace: "bgts_data_team"

  create_table "dnb_smad_201301", id: false, force: true do |t|
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

  add_index "dnb_smad_201301", ["duns_number"], name: "idx_smad_201301", unique: true, tablespace: "bgts_data_team"

  create_table "dnb_smad_201307", id: false, force: true do |t|
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

  create_table "dnb_smad_201401", id: false, force: true do |t|
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

  create_table "dnb_test_csad_201301", id: false, force: true do |t|
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
    t.decimal  "paydex1_paydex24"
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
