module ImporterHelper
  # ImporterHelper::CSV
  class CSV < ImporterHelper::Base
    require 'csv'

    def import(&block)
      csv = ::CSV.open(filename, 'r:ISO-8859-15:UTF-8')
      csv.shift if skip_headers
      total_elapsed_time = Benchmark.realtime do
        csv.each do |row|
          @iterator += 1
          @data = block.call(row, data, iterator, csv) if block_given?
        end
      end
      logger.debug "total time: #{total_elapsed_time}s"
      @data
    end

    def self.find_best_value(csad_value, smad_value)
      if csad_value && csad_value.to_i != 0
        csad_value
      elsif smad_value && smad_value.to_i != 0
        smad_value
      else
        0
      end
    end

    def self.parse_loc_ind(value)
      case value.to_s.downcase
      when 'h'
        1
      when 's'
        4
      when 'b'
        5
      end
    end

    def find_loc_ind(csad, smad)
      klass = self.class
      if csad
        klass.parse_loc_ind(csad.loc_ind)
      elsif smad
        klass.parse_loc_ind(smad.status)
      else
        5
      end
    end

    def find_decimal(csad, smad, csad_field, smad_field)
      csad_value = find_non_nil_decimal(csad, csad_field)
      smad_value = find_non_nil_decimal(smad, smad_field)
      self.class.find_best_value(csad_value, smad_value)
    end

    def self.max_range_string(max_range)
      max_range.match(/([^\s]+)/)[0] + '+'
    end

    private

    def find_non_nil_decimal(obj, field)
      obj ? if_nil(obj.send(field)) { |value| value.to_d } : nil
    end
  end
end
