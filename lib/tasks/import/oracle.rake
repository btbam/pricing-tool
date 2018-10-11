require 'rubygems'
require 'pp'
require 'benchmark'
require 'etl'

$stdout.sync = true

namespace :import do
  namespace :oracle do
    desc 'import all tables from oracle'
    task all: [:environment] do # |t, args|
      tables = %w(dnbsmad dnbcsad)
      tables.each do |table|
        begin
          Rake::Task["import:oracle:#{table}"].invoke
        rescue => e
          puts "Import failed: #{table}"
          puts e.message + "\n" + e.backtrace.join("\n")
        end
      end
    end

    # Distinct dates
    # OracleCsad as_of_dt: "2004-11-01 00:00:00"
    # OracleCsad as_of_dt: "2005-01-01 00:00:00"
    # OracleCsad as_of_dt: "2005-07-01 00:00:00"
    # OracleCsad as_of_dt: "2006-01-01 00:00:00"
    # OracleCsad as_of_dt: "2006-07-01 00:00:00"
    # OracleCsad as_of_dt: "2007-01-01 00:00:00"
    # OracleCsad as_of_dt: "2007-07-01 00:00:00"
    # OracleCsad as_of_dt: "2008-01-01 00:00:00"
    # OracleCsad as_of_dt: "2008-07-01 00:00:00"
    # OracleCsad as_of_dt: "2009-01-01 00:00:00"
    # OracleCsad as_of_dt: "2009-07-01 00:00:00"
    # OracleCsad as_of_dt: "2010-01-01 00:00:00"
    # OracleCsad as_of_dt: "2010-07-01 00:00:00"
    # OracleCsad as_of_dt: "2011-01-01 00:00:00"
    # OracleCsad as_of_dt: "2011-07-01 00:00:00"
    # OracleCsad as_of_dt: "2012-01-01 00:00:00"
    # OracleCsad as_of_dt: "2012-07-01 00:00:00"
    # OracleCsad as_of_dt: "2013-01-01 00:00:00"
    # OracleCsad as_of_dt: "2013-07-01 00:00:00"
    # OracleCsad as_of_dt: "2014-01-01 00:00:00"
    # OracleCsad as_of_dt: "2014-07-01 00:00:00"

    desc 'import dnbsmad from oracle to postgres'
    task :dnbsmad, [:useDB] => [:environment] do # |t, args|
      Rails.application.eager_load!

      helper = ImporterHelper::Oracle.new

      fields = {
        duns_number: ->(r) { r.duns_number.to_d.floor },
        incorporation_date: ->(r) { helper.string_to_date(r.incorpdt) },
        dnb_last_updated: ->(r) { helper.string_to_date(r.base_dat) },
        sales_volume: ->(r) { r.sales.to_d }, # maybe from CSAD?
        small_business: ->(r) { helper.if_true(r.dmdisbus, 'y') },
        local_employee_total: ->(r) { r.emphere.to_d.floor }, # CSAD emplhere?
        global_employee_total: ->(r) { helper.if_nil(r.emptotl) { r.emptotl.to_d.floor } }, # CSAD totempl?
        hq_state: :state_ph,
        as_of_date: :as_of_dt,
        compound_key: ->(r) { "#{r.duns_number}-#{r.as_of_dt.strftime('%Y-%m-%d')}" }
      }

      select_columns = %w(duns_number incorpdt base_dat sales dmdisbus emphere state_ph emptotl as_of_dt)

      date_expr = "\"L_ADM_LND\".\"LND_T_DNB_SMAD\".\"AS_OF_DT\" "
      date_expr += ">= TO_DATE('#{DateHelper.two_years_ago.strftime('%d%^b%Y')}', 'DDMONYYYY')"
      importer = ETL.importer(
        source_model: OracleSmad,
        destination_model: CompanyInfo,
        attributes: fields,
        source_select_columns: select_columns,
        batch_size: 20_000,
        pool: 4,
        validate: false,
        source_query: -> { OracleSmad.where(date_expr).order(duns_number: :desc, as_of_dt: :desc) },
        force_full_update: true,
        update: {
          with_lambda: ->(r) { "#{r.duns_number}-#{r.as_of_dt.strftime('%Y-%m-%d')}" },
          on_column: :compound_key }
      )

      importer.run
    end

    desc 'import dnbcsad from oracle to postgres'
    task :dnbcsad, [:useDB] => [:environment] do # |t, args|
      Rails.application.eager_load!

      helper = ImporterHelper::Oracle.new

      fields = {
        duns_number: ->(r) { r.duns_number.to_d.floor },
        start_year: ->(r) { r.yrstart.to_i },
        financial_stress_score: ->(r) { helper.if_nil(r.fspoints) { r.fspoints.to_d } },
        credit_score_class: ->(r) { helper.if_nil(r.cscore) { r.cscore.to_i } },
        credit_score: ->(r) { helper.if_nil(r.cpoints) { r.cpoints.to_d } },
        financial_stress_score_class: ->(r) { helper.if_nil(r.fscore) { r.fscore.to_i } },
        out_of_business: ->(r) { helper.if_true(r.ob_ind.floor.to_s, '1') }, # maybe from SMAD?
        condition: ->(r) { helper.determine_condition(r.cond_ind) }, # SMAD conditn?
        phone_number: ->(r) { helper.if_nil(r.telephone_number) { r.telephone_number.to_d.floor } }, # SMAD phone?
        total_net_worth: ->(r) { helper.if_nil(r.networth) { r.networth.to_d } }, # SMAD worth?
        is_public: ->(r) { helper.if_true(r.pubpvt, 's') }, # SMAD public?
        as_of_date: :as_of_dt,
        compound_key: ->(r) { "#{r.duns_number}-#{r.as_of_dt.strftime('%Y-%m-%d')}" }
      }

      select_columns = %w(
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

      date_expr = "\"L_ADM_LND\".\"LND_T_DNB_CSAD\".\"AS_OF_DT\" "
      date_expr += ">= TO_DATE('#{DateHelper.two_years_ago.strftime('%d%^b%Y')}', 'DDMONYYYY')"
      importer = ETL.importer(
        source_model: OracleCsad,
        destination_model: CompanyInfo,
        attributes: fields,
        source_select_columns: select_columns,
        batch_size: 20_000,
        pool: 4,
        source_query: -> { OracleCsad.where(date_expr).order(duns_number: :desc, as_of_dt: :desc) },
        force_full_update: true,
        update: {
          with_lambda: ->(r) { "#{r.duns_number}-#{r.as_of_dt.strftime('%Y-%m-%d')}" },
          on_column: :compound_key }
      )

      importer.run
    end
  end
end
