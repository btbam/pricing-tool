require 'support/api_helper'
require 'support/comparables_helper'

RSpec.describe Platform::Comparables do
  describe 'GET /api/entity/:duns_number/comparables' do
    def expect_common_fields(field, value, sect, compare_section, check_section)
      case field
      when 'loss_ratio'
        expect(value).to eq compare_section.compare.loss_ratio.to_s
      when 'menu'
        expect(value).to eq check_section.menu
      when 'menu_select'
        expect(value).to eq check_section.menu_select
      when 'total_policies'
        expect(value).to eq compare_section.compare.num_policies
      when 'total_policies_with_claims'
        expect(value).to eq compare_section.compare.num_policies_with_positive_claims
      else
        fail "Missing field #{field} in section #{sect}"
      end
    end

    include_context 'comparables setup'
    context 'when logged in with privileges' do
      include_context 'logged in with privileges'
      context 'when the duns_number exists' do
        shared_examples 'compare api section' do
          it 'returns the comparables section information' do
            post "/api/entity/#{example_company.duns_number}/comparables/#{compare_endpoint}",
                 menu_id: check_section.menu_select,
                 business_product: example_company.business_product.name,
                 business_type: example_company.business_type.name
            expect(last_response.status).to eql(200)
            response = JSON.parse(last_response.body)
            response.each do |sect, obj|
              obj.each do |field, value|
                case sect
                when compare_endpoint
                  case compare_endpoint
                  when 'loss_experience'
                    case field
                    when 'rate_needed_14'
                      expect(value).to eq comparables_sections[sect].rate_needed_14.to_s
                    when 'target_loss_ratio'
                      expect(value).to eq comparables_sections[sect].target_loss_ratio.to_s
                    when 'year'
                      expect(value).to eq comparables_sections[sect].compare.business_year.name
                    else
                      expect_common_fields(field, value, sect, comparables_sections[sect], check_section)
                    end
                  when 'financial_health'
                    case field
                    when 'industry_average'
                      expect(value).to eq check_section.industry_average.to_s
                    when 'financial_stress_score'
                      expect(value).to eq check_section.financial_stress_score.to_s
                    else
                      expect_common_fields(field, value, sect, comparables_sections[sect], check_section)
                    end
                  else
                    expect_common_fields(field, value, sect, compare_section, check_section)
                  end
                else
                  fail "Extra section #{sect} in request"
                end
              end
            end
          end
        end

        context 'when the industry values are not changed' do
          let!(:compare_section) { industry }
          let!(:compare_endpoint) { 'industry' }
          let!(:check_section) { CompareApiSection::Industry.new(loss_experience, compare_section) }
          it_behaves_like 'compare api section'
        end

        context 'when the industry values are changed' do
          let!(:compare_section) { industry_2 }
          let!(:compare_endpoint) { 'industry' }
          let!(:check_section) { CompareApiSection::Industry.new(loss_experience, compare_section) }
          it_behaves_like 'compare api section'
        end

        context 'when the state values are not changed' do
          let!(:compare_section) { state }
          let!(:compare_endpoint) { 'state' }
          let!(:check_section) { CompareApiSection::State.new(loss_experience, compare_section) }
          it_behaves_like 'compare api section'
        end

        context 'when the state values are changed' do
          let!(:compare_section) { state_2 }
          let!(:compare_endpoint) { 'state' }
          let!(:check_section) { CompareApiSection::State.new(loss_experience, compare_section) }
          it_behaves_like 'compare api section'
        end

        context 'when the size_of_company values are not changed' do
          let!(:compare_section) { size_of_company }
          let!(:compare_endpoint) { 'size_of_company' }
          let!(:check_section) { CompareApiSection::SizeOfCompany.new(loss_experience, compare_section) }
          it_behaves_like 'compare api section'
        end

        context 'when the size_of_company values are changed' do
          let!(:compare_section) { size_of_company_2 }
          let!(:compare_endpoint) { 'size_of_company' }
          let!(:check_section) { CompareApiSection::SizeOfCompany.new(loss_experience, compare_section) }
          it_behaves_like 'compare api section'
        end

        context 'when the number_of_employees values are not changed' do
          let!(:compare_section) { number_of_employees }
          let!(:compare_endpoint) { 'number_of_employees' }
          let!(:check_section) { CompareApiSection::NumberOfEmployees.new(loss_experience, compare_section) }
          it_behaves_like 'compare api section'
        end

        context 'when the number_of_employees values are changed' do
          let!(:compare_section) { number_of_employees_2 }
          let!(:compare_endpoint) { 'number_of_employees' }
          let!(:check_section) { CompareApiSection::NumberOfEmployees.new(loss_experience, compare_section) }
          it_behaves_like 'compare api section'
        end

        context 'when the loss_experience values are not changed' do
          let!(:compare_section) { loss_experience }
          let!(:compare_endpoint) { 'loss_experience' }
          let!(:check_section) { CompareApiSection::LossExperience.new(loss_experience) }
          it_behaves_like 'compare api section'
        end

        context 'when the loss_experience values are changed' do
          let!(:compare_section) { loss_experience_2 }
          let!(:compare_endpoint) { 'loss_experience' }
          let!(:check_section) { CompareApiSection::LossExperience.new(loss_experience) }
          it_behaves_like 'compare api section'
        end

        context 'when the financial_health values are not changed' do
          let!(:compare_section) { financial_health }
          let!(:compare_endpoint) { 'financial_health' }
          let!(:check_section) do
            CompareApiSection::FinancialHealth.new(loss_experience,
                                                   compare_section,
                                                   example_company)
          end
          it_behaves_like 'compare api section'
        end

        context 'when the financial_health values are changed' do
          let!(:compare_section) { financial_health_2 }
          let!(:compare_endpoint) { 'financial_health' }
          let!(:check_section) do
            CompareApiSection::FinancialHealth.new(loss_experience,
                                                   compare_section,
                                                   example_company)
          end
          it_behaves_like 'compare api section'
        end

        it 'returns all comparables for a company' do
          post "/api/entity/#{example_company.duns_number}/comparables",
               business_product: example_company.business_product.name,
               menu_selects: '{}',
               business_type: example_company.business_type.name
          expect(last_response.status).to eql(201)
          response = JSON.parse(last_response.body)
          response.each do |sect, obj|
            obj.each do |field, value|
              case sect
              when 'industry'
                check_industry = CompareApiSection::Industry.new(loss_experience, comparables_sections[sect])
                expect_common_fields(field, value, sect, comparables_sections[sect], check_industry)
              when 'loss_experience'
                check_loss_experience = CompareApiSection::LossExperience.new(loss_experience)
                case field
                when 'rate_needed_14'
                  expect(value).to eq comparables_sections[sect].rate_needed_14.to_s
                when 'target_loss_ratio'
                  expect(value).to eq comparables_sections[sect].target_loss_ratio.to_s
                when 'year'
                  expect(value).to eq comparables_sections[sect].compare.business_year.name
                else
                  expect_common_fields(field, value, sect, comparables_sections[sect], check_loss_experience)
                end
              when 'state'
                check_state = CompareApiSection::State.new(loss_experience, comparables_sections[sect])
                expect_common_fields(field, value, sect, comparables_sections[sect], check_state)
              when 'size_of_company'
                check_size = CompareApiSection::SizeOfCompany.new(loss_experience, comparables_sections[sect])
                expect_common_fields(field, value, sect, comparables_sections[sect], check_size)
              when 'number_of_employees'
                check_employees = CompareApiSection::NumberOfEmployees.new(loss_experience, comparables_sections[sect])
                expect_common_fields(field, value, sect, comparables_sections[sect], check_employees)
              when 'financial_health'
                check_health = CompareApiSection::FinancialHealth.new(loss_experience,
                                                                      comparables_sections[sect],
                                                                      example_company)
                case field
                when 'industry_average'
                  expect(value).to eq check_health.industry_average.to_s
                when 'financial_stress_score'
                  expect(value).to eq check_health.financial_stress_score.to_s
                else
                  expect_common_fields(field, value, sect, comparables_sections[sect], check_health)
                end
              else
                fail "Missing section #{sect}"
              end
            end
          end
        end
      end
    end
  end
end
