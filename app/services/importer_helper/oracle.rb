module ImporterHelper
  # ImporterHelper::Oracle
  class Oracle < ImporterHelper::Base
    # TODO: YAML Load these values
    COMPANY_OWNERSHIP_VALUES = {
      'a' => 'Owns',
      'b' => 'Rents',
      'c' => 'Leases',
      'd' => 'Operates from Residence',
      'e' => 'Other'
    }

    # TODO: YAML Load these values
    FRANCHIZE_OWNERSHIP_VALUES = {
      'c' => 'Company Owned',
      'f' => 'Franchizee Owned'
    }

    # TODO: YAML Load these values
    CONDITION_VALUES = {
      't' => 'Strong',
      'u' => 'Good',
      'v' => 'Fair',
      'w' => 'Unbalanced'
    }

    # TODO: does this actually need to return a boolean? needs a comment
    # TODO: :reek:UtilityFunction
    def if_true(value, equals)
      value && value.downcase == equals.downcase ? true : false
    end

    def string_to_date(value)
      value = value.to_s.split('.')[0].rjust(8, '0')
      value != '00000000' ? format_date(value) : nil
    end

    def determine_company_ownership(value)
      retrieve_value_from(COMPANY_OWNERSHIP_VALUES, value)
    end

    def determine_franchize_ownership(value)
      retrieve_value_from(FRANCHIZE_OWNERSHIP_VALUES, value)
    end

    def determine_condition(value)
      retrieve_value_from(CONDITION_VALUES, value)
    end

    private

    def format_date(value)
      year = value[4..7].to_i
      month = format_date_part(value[0..1], 12)
      date = value[2..3].to_i
      begin
        Date.new(year, month, replace_zeros(date))
      rescue ArgumentError
        Date.new(year, month, format_date_part(date, 28))
      end
    end

    def format_date_part(value, max)
      new_value = replace_zeros(value)
      new_value = max if new_value > max
      new_value.to_i
    end

    # TODO: :reek:UtilityFunction
    def retrieve_value_from(hash, value)
      value && hash[value.downcase] || 'N/A'
    end

    # TODO: :reek:UtilityFunction
    def replace_zeros(value)
      value = '01' if value == '00' || value.to_s == '0'
      value.to_i
    end
  end
end
