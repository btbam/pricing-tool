class OracleCsad < OracleRecord
  self.table_name = 'L_ADM_LND.LND_T_DNB_CSAD'

  include OracleHelper
  include DatabaseHelper
end
