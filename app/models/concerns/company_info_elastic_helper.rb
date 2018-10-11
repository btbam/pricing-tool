# CompanyInfoElasticHelper
module CompanyInfoElasticHelper
  extend ActiveSupport::Concern
  include DatabaseHelper

  # CompanyInfoElasticHelper::ClassMethods
  module ClassMethods
    def attributes_from_es_row(es_row)
      {
        name: es_row.name,
        duns_number: es_row.duns_number,
        street_address: es_row.street_address,
        city: es_row.city,
        state: es_row.state,
        zip_code: es_row.zip_code,
        industry_code: es_row.sic_code,
        tree_pos: es_row.tree_pos,
        address: generate_address(row: es_row),
        sales_volume: es_row.sales_volume,
        global_employee_total: es_row.global_employee_total
      }
    end

    def create_from_es(opts = {})
      duns = opts[:duns]
      es_row = duns ? CompanyRepository.new.find_by_duns(duns) : opts[:row]
      pg_c_from_es_row(es_row) if es_row
    end

    def generate_address(opts = {})
      new.generate_address opts
    end

    def generate_state(opts = {})
      new.generate_state opts
    end

    # :reek:NestedIterators
    # :reek:UtilityFunction
    def es_with_name(policies)
      named_policies = []
      CompanyRepository.new.find_by_duns_array(policies.map(&:duns_number)).tap do |repos|
        policies.each do |policy|
          repos.each do |repo|
            if policy.duns_number == repo.duns_number
              policy.name = repo.name
              named_policies << policy
            end
          end
        end
      end
      named_policies
    end

    def pg_c_from_es_row(es_row)
      pg_c = find_by_duns(es_row.duns_number) || new
      pg_c.attributes = attributes_from_es_row(es_row)
      pg_c.industry = pg_c.industry_average_sic_description
      pg_c.hq_state = pg_c.hq_state_from_state
      pg_c
    end
  end

  def generate_address(opts = {})
    result = find_or_pass_row opts[:row]
    "#{result.street_address} #{result.city}, #{result.state} #{result.zip_code[0..4]}"
  end

  def generate_state(opts = {})
    result = find_or_pass_row opts[:row]
    result.state
  end

  private

  def find_or_pass_row(row = nil)
    row || CompanyRepository.new.find_by_duns(duns_number)
  end
end
