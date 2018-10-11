class DatabaseFallback::PgOracle::Record
  attr_accessor :result, :helper

  def initialize(result)
    @result = result
    @oracle_result_found = false
  end

  def self.process_result(result)
    record = new(result)
    record.process_result
    record
  end

  def process_result
    if result.object_state == Digest::MD5.hexdigest(result.class.inspect)
      result
    else
      update_result_and_save
    end
  end

  private

  def update_result_and_save
    @result.object_state = Digest::MD5.hexdigest(result.class.inspect)
    update_result
    result.save if @oracle_result_found
  end

  def update_result
    %w(csad smad).each do |obj|
      @helper = "ImporterHelper::Oracle::#{obj.titleize}".constantize.new
      oracle_result = query_based_on_object(obj, helper.select_columns)
      process_oracle_result(oracle_result)
    end
  end

  def process_oracle_result(oracle_result)
    return unless oracle_result
    @oracle_result_found = true
    oracle_result.attributes.each do |field, value|
      assign_oracle_to_pg(field, value)
    end
  end

  def assign_oracle_to_pg(field, value)
    return unless field
    result.send(pg_field(field), oracle_value(field, value))
  end

  def oracle_value(field, value)
    helper.converters[field.to_sym].call(value)
  end

  def pg_field(field)
    (helper.convert_fields[field.to_sym].to_s + '=').to_sym
  end

  def query_based_on_object(obj, select_columns)
    result_where = { duns_number: result.duns_number }
    date_where = "as_of_dt = TO_DATE('#{result.as_of_date.strftime('%d%^b%Y')}', 'DDMONYYYY')"
    "Oracle#{obj.titleize}".constantize.select(select_columns).where(result_where).where(date_where).limit(1).first
  end
end
