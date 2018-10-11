# DateHelper
class DateHelper
  def self.two_years_ago
    time = Time.now
    month = time.mon >= 7 ? 7 : 1
    Time.new(time.year, month, 1) - 2.years
  end

  def self.interval_now
    two_years_ago + 2.years
  end

  def self.intervals(from, interval)
    [].tap do |dates|
      the_present = interval_now
      while from <= the_present
        dates << from
        from += interval
      end
    end
  end
end
