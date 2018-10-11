class OracleSmad < OracleRecord
  self.table_name = 'L_ADM_LND.LND_T_DNB_SMAD'

  include OracleHelper
  include DatabaseHelper
end
