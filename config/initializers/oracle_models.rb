if !%w(rake rspec).include?(File.basename($PROGRAM_NAME)) && !defined?(Rails::Console)
  ActiveRecord::ConnectionAdapters::OracleEnhancedAdapter.cache_columns = true
  OracleSmad.maximum(:duns_number)
  OracleCsad.maximum(:duns_number)
  begin
    RenewalBusiness.maximum(:duns_number)
  rescue
    nil
  end
end
