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

ActiveRecord::Schema.define(version: 20150819161209) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "business_products", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "business_products", ["name"], name: "index_business_products_on_name", using: :btree

  create_table "business_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "business_types", ["name"], name: "index_business_types_on_name", using: :btree

  create_table "business_years", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "business_years", ["name"], name: "index_business_years_on_name", using: :btree

  create_table "calculator_financial_factors", force: true do |t|
    t.integer  "dnb_financial_distress_score"
    t.decimal  "relativity_factor"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "business_product_id"
    t.integer  "business_type_id"
  end

  add_index "calculator_financial_factors", ["business_product_id"], name: "index_calculator_financial_factors_on_business_product_id", using: :btree
  add_index "calculator_financial_factors", ["business_type_id"], name: "index_calculator_financial_factors_on_business_type_id", using: :btree
  add_index "calculator_financial_factors", ["dnb_financial_distress_score"], name: "financial_factors", using: :btree

  create_table "calculator_industry_factors", force: true do |t|
    t.integer  "sic_code"
    t.string   "name"
    t.decimal  "factor"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "business_product_id"
    t.integer  "business_type_id"
    t.boolean  "ca"
  end

  add_index "calculator_industry_factors", ["business_product_id"], name: "index_calculator_industry_factors_on_business_product_id", using: :btree
  add_index "calculator_industry_factors", ["business_type_id"], name: "index_calculator_industry_factors_on_business_type_id", using: :btree
  add_index "calculator_industry_factors", ["sic_code"], name: "index_calculator_industry_factors_on_sic_code", using: :btree

  create_table "companies", force: true do |t|
    t.integer  "duns_number"
    t.string   "name"
    t.integer  "location_type_cd"
    t.integer  "subsidiary_indc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "companies", ["duns_number"], name: "index_companies_on_duns_number", using: :btree

  create_table "company_infos", force: true do |t|
    t.integer  "duns_number"
    t.integer  "global_employee_total"
    t.date     "incorporation_date"
    t.date     "dnb_last_updated"
    t.integer  "start_year"
    t.boolean  "out_of_business"
    t.boolean  "is_public"
    t.integer  "sales_volume",                 limit: 8
    t.boolean  "small_business"
    t.string   "condition"
    t.integer  "local_employee_total"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phone_number"
    t.string   "hq_state"
    t.text     "description"
    t.string   "url"
    t.integer  "total_net_worth",              limit: 8
    t.boolean  "customer"
    t.decimal  "financial_stress_score"
    t.integer  "credit_score_class"
    t.decimal  "credit_score"
    t.integer  "financial_stress_score_class"
    t.datetime "as_of_date"
    t.string   "compound_key"
    t.string   "object_state"
  end

  add_index "company_infos", ["compound_key"], name: "index_company_infos_on_compound_key", using: :btree
  add_index "company_infos", ["as_of_date"], name: "index_company_infos_on_as_of_date", using: :btree
  add_index "company_infos", ["duns_number"], name: "index_company_infos_on_duns_number", using: :btree

  create_table "compare_books", force: true do |t|
    t.integer  "compare_id"
    t.string   "rate_needed_14"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "target_loss_ratio"
  end

  add_index "compare_books", ["compare_id"], name: "index_compare_books_on_compare_id", using: :btree

  create_table "compare_company_size_sale_cs", force: true do |t|
    t.integer  "compare_id"
    t.integer  "klass"
    t.string   "range"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "compare_company_size_sale_cs", ["compare_id"], name: "index_compare_company_size_sale_cs_on_compare_id", using: :btree

  create_table "compare_company_size_sale_sms", force: true do |t|
    t.integer  "compare_id"
    t.integer  "klass"
    t.string   "range"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "range_low"
    t.integer  "range_high", limit: 8
  end

  add_index "compare_company_size_sale_sms", ["compare_id"], name: "index_compare_company_size_sale_sms_on_compare_id", using: :btree

  create_table "compare_financial_healths", force: true do |t|
    t.integer  "compare_id"
    t.string   "financial_stress_score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "compare_financial_healths", ["compare_id"], name: "index_compare_financial_healths_on_compare_id", using: :btree

  create_table "compare_industries", force: true do |t|
    t.integer  "compare_id"
    t.integer  "sic_code"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "compare_industries", ["compare_id"], name: "index_compare_industries_on_compare_id", using: :btree

  create_table "compare_number_employee_cs", force: true do |t|
    t.integer  "compare_id"
    t.integer  "klass"
    t.string   "range"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "compare_number_employee_cs", ["compare_id"], name: "index_compare_number_employee_cs_on_compare_id", using: :btree

  create_table "compare_number_employee_sms", force: true do |t|
    t.integer  "compare_id"
    t.integer  "klass"
    t.string   "range"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "range_low"
    t.integer  "range_high"
  end

  add_index "compare_number_employee_sms", ["compare_id"], name: "index_compare_number_employee_sms_on_compare_id", using: :btree

  create_table "compare_salary_sale_cs", force: true do |t|
    t.integer  "compare_id"
    t.integer  "klass"
    t.string   "range"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "compare_salary_sale_cs", ["compare_id"], name: "index_compare_salary_sale_cs_on_compare_id", using: :btree

  create_table "compare_salary_sale_sms", force: true do |t|
    t.integer  "compare_id"
    t.integer  "klass"
    t.string   "range"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "range_low"
    t.integer  "range_high", limit: 8
  end

  add_index "compare_salary_sale_sms", ["compare_id"], name: "index_compare_salary_sale_sms_on_compare_id", using: :btree

  create_table "compare_state_sms", force: true do |t|
    t.integer  "compare_id"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "compare_state_sms", ["compare_id"], name: "index_compare_state_sms_on_compare_id", using: :btree

  create_table "compare_tax_states", force: true do |t|
    t.integer  "compare_id"
    t.integer  "code"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "compare_tax_states", ["compare_id"], name: "index_compare_tax_states_on_compare_id", using: :btree

  create_table "compares", force: true do |t|
    t.integer  "business_product_id"
    t.integer  "business_type_id"
    t.integer  "num_policies"
    t.integer  "num_policies_with_claims"
    t.integer  "num_policies_with_positive_claims"
    t.integer  "num_of_claims"
    t.integer  "num_of_claims_with_positive_payment"
    t.decimal  "loss_ratio"
    t.integer  "business_year_id"
    t.integer  "compare_type_id"
    t.string   "compare_type_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "compares", ["business_product_id"], name: "index_compares_on_business_product_id", using: :btree
  add_index "compares", ["business_type_id"], name: "index_compares_on_business_type_id", using: :btree
  add_index "compares", ["business_year_id"], name: "index_compares_on_business_year_id", using: :btree
  add_index "compares", ["compare_type_id"], name: "index_compares_on_compare_type_id", using: :btree
  add_index "compares", ["compare_type_type"], name: "index_compares_on_compare_type_type", using: :btree

  create_table "customers", force: true do |t|
    t.string   "product"
    t.string   "policy_type"
    t.integer  "duns_number"
    t.string   "insured_name"
    t.integer  "policy_year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "customers", ["duns_number"], name: "index_customers_on_duns_number", using: :btree

  create_table "dnb_csad201401s", force: true do |t|
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
    t.integer  "paydex1"
    t.integer  "paydex2"
    t.integer  "paydex3"
    t.integer  "paydex4"
    t.integer  "paydex5"
    t.integer  "paydex6"
    t.integer  "paydex7"
    t.integer  "paydex8"
    t.integer  "paydex9"
    t.integer  "paydex10"
    t.integer  "paydex11"
    t.integer  "paydex12"
    t.integer  "paydex13"
    t.integer  "paydex14"
    t.integer  "paydex15"
    t.integer  "paydex16"
    t.integer  "paydex17"
    t.integer  "paydex18"
    t.integer  "paydex19"
    t.integer  "paydex20"
    t.integer  "paydex21"
    t.integer  "paydex22"
    t.integer  "paydex23"
    t.integer  "paydex24"
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

  create_table "dnb_smad201401s", force: true do |t|
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

  create_table "dno_groups", force: true do |t|
    t.integer "gp_index"
    t.string  "industry_groups"
    t.string  "state_groups"
    t.decimal "min_sales"
    t.decimal "max_sales"
    t.decimal "min_f"
    t.decimal "max_f"
    t.integer "npol"
    t.decimal "gwp_sum"
    t.decimal "pred_loss_sum"
    t.decimal "actual_loss_sum"
    t.decimal "pred_gross_sum"
    t.decimal "actual_gross_sum"
    t.decimal "max_loss"
    t.decimal "actual_rt"
    t.decimal "pred_rt"
    t.decimal "actual_lr"
    t.decimal "pred_lr"
    t.integer "cap_rt_need"
    t.decimal "cap_rate_gwp"
    t.integer "group_code"
  end

  create_table "epli_groups", force: true do |t|
    t.integer "gp_index"
    t.string  "industry_groups"
    t.string  "state_groups"
    t.decimal "min_empl"
    t.decimal "max_empl"
    t.integer "npol"
    t.decimal "gwp_sum"
    t.decimal "pred_loss_sum"
    t.decimal "actual_loss_sum"
    t.decimal "pred_gross_sum"
    t.decimal "actual_gross_sum"
    t.decimal "max_loss"
    t.decimal "actual_rt"
    t.decimal "pred_rt"
    t.decimal "actual_lr"
    t.decimal "pred_lr"
    t.integer "cap_rt_need"
    t.decimal "cap_rate_gwp"
    t.integer "group_code"
  end

  create_table "importer_runs", force: true do |t|
    t.text     "error_trace"
    t.datetime "started_at"
    t.datetime "completed_at"
    t.integer  "duration"
    t.string   "importer_task"
    t.string   "importer_version"
    t.integer  "records_created"
    t.integer  "records_updated"
    t.json     "validation_errors"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "importer_runs", ["completed_at"], name: "index_importer_runs_on_completed_at", using: :btree
  add_index "importer_runs", ["importer_task"], name: "index_importer_runs_on_importer_task", using: :btree
  add_index "importer_runs", ["importer_version"], name: "index_importer_runs_on_importer_version", using: :btree
  add_index "importer_runs", ["started_at"], name: "index_importer_runs_on_started_at", using: :btree

  create_table "industry_averages", force: true do |t|
    t.string   "category"
    t.integer  "sic_code"
    t.string   "sic_description"
    t.integer  "num_policies"
    t.decimal  "avg_employees"
    t.integer  "avg_revenue",             limit: 8
    t.decimal  "avg_financial_stress"
    t.decimal  "avg_year_started"
    t.decimal  "median_employees"
    t.integer  "median_revenue",          limit: 8
    t.decimal  "median_financial_stress"
    t.integer  "median_year_started"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "industry_averages", ["sic_code"], name: "index_industry_averages_on_sic_code", using: :btree

  create_table "industry_groups", force: true do |t|
    t.integer "sic_code"
    t.string  "industry"
    t.integer "group_code"
    t.integer "business_product_id"
    t.integer "business_type_id"
  end

  add_index "industry_groups", ["business_product_id"], name: "index_industry_groups_on_business_product_id", using: :btree
  add_index "industry_groups", ["business_type_id"], name: "index_industry_groups_on_business_type_id", using: :btree
  add_index "industry_groups", ["group_code"], name: "index_industry_groups_on_group_code", using: :btree
  add_index "industry_groups", ["industry"], name: "index_industry_groups_on_industry", using: :btree
  add_index "industry_groups", ["sic_code"], name: "index_industry_groups_on_sic_code", using: :btree

  create_table "policies", force: true do |t|
    t.integer "policy_number"
    t.integer "limit",               limit: 8
    t.integer "retention",           limit: 8
    t.integer "sales",               limit: 8
    t.integer "gwp"
    t.integer "loss_severity"
    t.integer "tax_state_code"
    t.string  "tax_state_abbr"
    t.integer "sic_code"
    t.integer "duns_number"
    t.integer "business_product_id"
    t.integer "business_type_id"
    t.integer "policy_year"
    t.integer "sic_00_code"
    t.integer "employee_count",      limit: 8
  end

  add_index "policies", ["business_product_id"], name: "index_policies_on_business_product_id", using: :btree
  add_index "policies", ["business_type_id"], name: "index_policies_on_business_type_id", using: :btree
  add_index "policies", ["duns_number"], name: "index_policies_on_duns_number", using: :btree
  add_index "policies", ["policy_number"], name: "index_policies_on_policy_number", using: :btree
  add_index "policies", ["policy_year"], name: "index_policies_on_policy_year", using: :btree
  add_index "policies", ["sic_00_code"], name: "index_policies_on_sic_00_code", using: :btree
  add_index "policies", ["sic_code"], name: "index_policies_on_sic_code", using: :btree

  create_table "user_histories", force: true do |t|
    t.integer  "user_id"
    t.integer  "duns_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "assets",               limit: 8
    t.integer  "years_in_operation"
    t.integer  "sic_code"
    t.integer  "user_history_do_id"
    t.integer  "user_history_epli_id"
  end

  add_index "user_histories", ["duns_number"], name: "index_user_histories_on_duns_number", using: :btree
  add_index "user_histories", ["user_history_do_id"], name: "index_user_histories_on_user_history_do_id", using: :btree
  add_index "user_histories", ["user_history_epli_id"], name: "index_user_histories_on_user_history_epli_id", using: :btree
  add_index "user_histories", ["user_id"], name: "index_user_histories_on_user_id", using: :btree

  create_table "user_history_dos", force: true do |t|
    t.integer  "limit",                                limit: 8
    t.integer  "retention",                            limit: 8
    t.decimal  "claims_history"
    t.decimal  "financial_conditions"
    t.decimal  "mergers_and_acquisitions"
    t.decimal  "management_experience_qualifications"
    t.decimal  "entity_nonentity_coverage"
    t.decimal  "revenue_asset_irregularities"
    t.decimal  "specialty_coverage"
    t.decimal  "private_company"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "has_changed",                                    default: false
    t.decimal  "industry"
    t.decimal  "litigation"
    t.decimal  "years_in_operation"
  end

  create_table "user_history_eplis", force: true do |t|
    t.integer  "limit",                               limit: 8
    t.integer  "retention",                           limit: 8
    t.decimal  "human_resources_and_loss_prevention"
    t.decimal  "workforce_mgmt"
    t.decimal  "incident_mgmt"
    t.decimal  "financial_conditions"
    t.decimal  "claims_reporting_procedures"
    t.decimal  "claims_history"
    t.decimal  "industry_third_party"
    t.integer  "total_non_union_full_time"
    t.integer  "total_non_union_part_time"
    t.integer  "total_union_full_time"
    t.integer  "total_union_part_time"
    t.integer  "total_foreign_full_time"
    t.integer  "total_foreign_part_time"
    t.integer  "california_non_union_full_time"
    t.integer  "california_non_union_part_time"
    t.integer  "california_union_full_time"
    t.integer  "california_union_part_time"
    t.integer  "dc_mi_fl_tx_non_union_full_time"
    t.integer  "dc_mi_fl_tx_non_union_part_time"
    t.integer  "dc_mi_fl_tx_union_full_time"
    t.integer  "dc_mi_fl_tx_union_part_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "has_changed",                                   default: false
    t.decimal  "prior_acts_coverage"
    t.decimal  "punitive_damage"
    t.decimal  "years_in_operation"
  end

  create_table "users", force: true do |t|
    t.string   "email",                              default: "", null: false
    t.string   "encrypted_password",                 default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "session_token",          limit: 128
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
