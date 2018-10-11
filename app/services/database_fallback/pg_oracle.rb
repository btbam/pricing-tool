class DatabaseFallback::PgOracle
  attr_accessor :duns_number, :date, :time_ago, :results

  def initialize(duns_number, **opts)
    @duns_number = duns_number
    @date = opts[:date]
    @time_ago = opts[:time_ago]
  end

  def self.fallback_if_necessary(duns_number, **opts)
    fallback = new(duns_number, opts)
    fallback.find_results_from_opts
    fallback.fill_missing_results_dates
    fallback.fallback
    fallback
  end

  def find_results_from_opts
    @results = CompanyInfo.by_duns(duns_number)
    @results = case
               when date
                 results.by_date(date).limit(1)
               when time_ago
                 results.time_ago(time_ago)
               else
                 results.limit(1)
               end
  end

  def fill_missing_results_dates
    interval_start_date = date || time_ago
    results_empty  = results.empty?
    if interval_start_date
      @results = fill_date_range(interval_start_date)
    elsif !results_empty
      assure_as_of_date
    elsif results_empty
      @results = [CompanyInfo.new(duns_number: duns_number, as_of_date: DateHelper.interval_now)]
    end
  end

  def fallback
    results.each { |result| DatabaseFallback::PgOracle::Record.process_result(result) }
  end

  private

  def fill_date_range(interval_start_date)
    DateHelper.intervals(interval_start_date, 6.months).map do |months_interval|
      found_record = detect_month(months_interval)
      found_record || CompanyInfo.new(duns_number: duns_number, as_of_date: months_interval)
    end
  end

  def detect_month(month)
    results.detect { |result| result.as_of_date == month }
  end

  def assure_as_of_date
    company_info = results.first
    company_info.update(as_of_date: DateHelper.interval_now) unless company_info.as_of_date
  end
end
