# MassModels
class MassModels
  attr_reader :model_prefix, :table_prefix, :parent_klass, :start_date, :one_offs

  # Example:
  # MassModels.new(
  #   model_prefix: 'OracleDnbCsad',
  #   table_prefix: 'dnb_csad_',
  #   parent_klass: OracleRecord,
  #   start_date: Date.new(2005, 1),
  #   one_offs: [Date.new(2004, 11)]
  # ).create

  def initialize(opts = {})
    @model_prefix = opts[:model_prefix]
    @table_prefix = opts[:table_prefix] || nil
    @parent_klass = opts[:parent_klass]
    @start_date = opts[:start_date]
    @one_offs = opts[:one_offs] || []
  end

  def create
    create_standard_date_models
    create_one_off_models
  end

  private

  def create_one_off_models
    one_offs.each do |model_date|
      create_model_by_date(model_date)
    end
  end

  def create_standard_date_models
    model_date = start_date
    while model_date < Date.today.beginning_of_month
      create_model_by_date(model_date)
      model_date += 6.months
    end
  end

  def create_model_by_date(model_date)
    date_name = model_date.strftime('%Y%m')
    table_name = table_prefix ? table_prefix + date_name : nil
    create_model(model_prefix + date_name, table_name)
  end

  def create_model(klass_name, table_name)
    if table_name
      Object.const_set(klass_name, Class.new(parent_klass) { self.table_name = table_name })
    else
      Object.const_set(klass_name, Class.new(parent_klass))
    end
  end
end
