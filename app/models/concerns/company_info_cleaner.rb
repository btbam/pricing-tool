# CompanyInfoCleaner
module CompanyInfoCleaner
  extend ActiveSupport::Concern
  include DnbCleaner

  attr_accessor :name, :description, :url, :industry, :address

  TOP_HQ = 1
  SUBSIDIARY = 2
  SINGLE_LOCATION = 4
  BRANCH = 5

  def sic_first
    super :industry_code
  end

  def set_fake_data
    self.description  ||= 'No Description Found'
    self.url          ||= 'N/A'
    self.industry     ||= 'N/A'
    self.address      ||= 'N/A'
  end

  def set_real_data
    self.hq_state = generate_hq_state
    self.start_year = years_since_start
    api = ApiParser::Glassdoor.new(company: self)
    api.set_company_data
    self.url = api.meta_url = api.glassdoor_url
    self.description = description_from_meta_data(api.meta_data)
  end

  def hq_state_from_state
    hq_state && hq_state.strip == '' && top_or_single? ? state : hq_state
  end

  def top_or_single?
    tree_pos_as_int = tree_pos.to_i
    tree_pos_as_int == TOP_HQ || tree_pos_as_int == SINGLE_LOCATION
  end

  def description_from_meta_data(meta_data)
    if meta_data
      meta = meta_data.meta
      description = meta_data.description ||
                    meta['og:description'] ||
                    meta['twitter:description']
    end
    description || missing_description
  end

  def set_missing_data
    self.description = missing_description
  end

  # TODO: Temporary fix until we figure out what to do with a potential missing
  # company vs not having access to see companies (if that is even possible)
  def missing_description
    'This company is missing a description.'
  end

  def years_since_start
    Time.now.year - start_year if start_year
  end

  def dno_renewal
    @dno_renewal ||= begin
                       RenewalBusiness.find_by_duns_dno(duns_number)
                     rescue
                       nil
                     end
  end

  def epli_renewal
    @epli_renewal ||= begin
                        RenewalBusiness.find_by_duns_epli(duns_number)
                      rescue
                        nil
                      end
  end

  def financial_institution?
    sic_first.to_i.between?(60, 67)
  end

  def employee_total
    global_employee_total || local_employee_total
  end

  private

  def generate_hq_state
    hq_state || (generate_state if self.respond_to?(:generate_state)) || 'N/A'
  end
end
