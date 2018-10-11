module Platform
  module Helpers
    module ComparableHelpers
      extend Grape::API::Helpers

      def apply_industry(name)
        return unless name
        compare_industry = Compare::Industry.where(name: name).first
        @ci.industry_code = compare_industry.sic_code
      end

      def apply_number_of_employees(number_of_employees)
        return unless number_of_employees
        range = ::RangeFromText.new(number_of_employees)
        compare_number = Compare::NumberEmployeeSm.from_range(range.low, range.high)
        @ci.global_employee_total = compare_number.range_low_or_nil
      end

      def apply_size_of_company(size_of_company)
        return unless size_of_company
        range = ::RangeFromText.new(size_of_company)
        compare_size = Compare::CompanySizeSaleSm.from_range(range.low, range.high)
        @ci.sales_volume = compare_size.range_low_or_nil
      end

      def apply_state(state)
        return unless state
        compare_state = Compare::StateSm.where(state: state).first
        @ci.state = compare_state.state
        section_json(@ci, 'state')
      end

      def section_json(company_info, section)
        compare_api_section = CompareApi.new(company_info, [section]).send(section.to_sym)
        serializer = case section
                     when 'loss_experience'
                       CompareSectionLossExperienceSerializer.new(compare_api_section)
                     when 'financial_health'
                       CompareSectionFinancialHealthSerializer.new(compare_api_section)
                     else
                       CompareSectionSerializer.new(compare_api_section)
                     end
        status 200
        JSON.parse(serializer.to_json(root: section))
      end
    end
  end
end
