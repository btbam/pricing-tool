class RangeFromText
  attr_accessor :high, :low

  def initialize(string)
    find_bounds(string)
  end

  def self.find_bound(digit, word)
    multiplier = case word
                 when 'M'
                   1_000_000
                 when 'k'
                   1_000
                 else
                   1
                 end
    digit.to_f * multiplier
  end

  def find_bounds(record)
    low_range, high_range = record.split('-').map(&:strip)

    low_d = find_digit(low_range)
    low_w = find_magnitude(low_range)
    high_d = find_digit(high_range)
    high_w = find_magnitude(high_range)

    klass = self.class
    @low = klass.find_bound(low_d, low_w)
    @high = klass.find_bound(high_d, high_w) - 1
  end

  def find_digit(digit)
    found_digit = digit_match(digit)
    digit && found_digit ? found_digit[0] : 0
  end

  def digit_match(digit)
    digit ? digit.match(/\d+\.*\d*/) : 0
  end

  def find_magnitude(magnitude)
    found_magnitude = magnitude_match(magnitude)
    magnitude && found_magnitude ? found_magnitude[0] : nil
  end

  def magnitude_match(magnitude)
    magnitude ? magnitude.match(/[a-z]+/i) : ''
  end
end
