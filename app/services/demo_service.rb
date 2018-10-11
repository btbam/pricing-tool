# DemoService
module DemoGenerator
  extend self

  # :reek:UtilityFunction
  def generate_menu(menu_items = [])
    menu_items
  end

  def generate_name
    Faker::Company.name
  end

  def generate_duns
    Faker::Company.duns_number.tr('^0-9', '').to_i
  end

  def generate_policy(type = nil, ci = nil)
    unless ci && ci.respond_to?(:duns_number) && ci.respond_to?(:name)
      ci = CompanyInfo.new(duns_number: generate_duns, name: generate_name)
    end

    Policy.new(
      policy_number: rand(100_000..999_999),
      limit: rand(15_000..30_000),
      retention: rand(10_000_000..30_000_000),
      sales: rand(1_000_000..500_000_000_000),
      gwp: rand(10_000..50_000),
      loss_severity: rand(50_000..200_000),
      tax_state_code: rand(1..50),
      tax_state_abbr: Faker::Address.state_abbr,
      sic_code: rand(0..99),
      duns_number: ci.duns_number,
      business_product: Business::Product.find_by_name(type.to_s.upcase),
      business_type: Business::Type.find_by_name('PRIVATE')
    )
  end
end

# rubocop:disable ClassLength
module DemoService
  include DemoGenerator

  extend self

  def generate_policies(ci = nil)
    unless ci && ci.respond_to?(:duns_number) && ci.respond_to?(:name)
      ci = CompanyInfo.new(duns_number: generate_duns, name: generate_name)
    end

    dno_policy = generate_policy(:do, ci)
    epli_policy = generate_policy(:epli, ci)

    policies = [dno_policy, epli_policy]
    12.times do
      policies << generate_policy(:do)
      policies << generate_policy(:epli)
    end
    policies
  end

  def generate_comparables
    {
      industry: industry,
      loss_experience: loss_experience,
      state: state,
      size_of_company: size_of_company,
      number_of_employees: number_of_employees,
      financial_health: financial_health
    }
  end

  def generate_comparables_section(section)
    { section => send(section) }
  end

  private

  def industry
    menu_items = [
      'Administration Of Environmental Quality Programs',
      'Administration Of General Economic Programs',
      'Administration Of Human Resource Programs',
      'Agricultural Production Crops',
      'Agricultural Production Livestock And Animal Specialties',
      'Agricultural Services',
      'Amusement And Recreation Services',
      'Anthracite Mining',
      'Apparel And Accessory Stores',
      'Apparel And Other Finished Products Made From Fabrics And Similar Materials',
      'Automotive Dealers And Gasoline Service Stations',
      'Automotive Repair, Services, And Parking',
      'Building Construction General Contractors And Operative Builders',
      'Building Materials, Hardware, Garden Supply, And Mobile Home Dealers',
      'Business Services',
      'Chemicals And Allied Products',
      'Coal Mining',
      'Communications',
      'Construction Special Trade Contractors',
      'Depository Institutions',
      'Eating And Drinking Places',
      'Educational Services',
      'Electric, Gas, And Sanitary Services',
      'Electronic And Other Electrical Equipment And Components, Except Computer Equipment',
      'Engineering, Accounting, Research, Management, And Related Services',
      'Executive, Legislative, And General Government, Except Finance',
      'Fabricated Metal Products, Except Machinery And Transportation Equipment',
      'Fishing, Hunting, And Trapping',
      'Food And Kindred Products',
      'Food Stores',
      'Forestry',
      'Furniture And Fixtures',
      'General Merchandise Stores',
      'Health Services',
      'Heavy Construction Other Than Building Construction Contractors',
      'Holding And Other Investment Offices',
      'Home Furniture, Furnishings, And Equipment Stores',
      'Hotels, Rooming Houses, Camps, And Other Lodging Places',
      'Industrial And Commercial Machinery And Computer Equipment',
      'Insurance Agents, Brokers, And Service',
      'Insurance Carriers',
      'Justice, Public Order, And Safety',
      'Leather And Leather Products',
      'Legal Services',
      'Local \u0026 Sururban Transit \u0026 Interurban Highway Passenger Transportation',
      'Lumber And Wood Products, Except Furniture',
      'Measuring, Analyzing, And Controlling Instruments; Photographic, Medical And Optical Goods; Watches And Clocks',
      'Membership Organizations',
      'Metal Mining',
      'Mining And Quarrying Of Nonmetallic Minerals, Except Fuels',
      'Miscellaneous Manufacturing Industries',
      'Miscellaneous Repair Services',
      'Miscellaneous Retail',
      'Miscellaneous Services',
      'Motion Pictures',
      'Motor Freight Transportation And Warehousing',
      'Museums, Art Galleries, And Botanical And Zoological Gardens',
      'National Security And International Affairs',
      'Non-Depository Credit Institutions',
      'Nonclassifiable Establishments',
      'Oil And Gas Extraction',
      'Paper And Allied Products',
      'Personal Services',
      'Petroleum Refining And Related Industries',
      'Pipe Lines, Except Natural Gas',
      'Primary Metal Industries',
      'Printing, Publishing, And Allied Industries',
      'Private Households',
      'Public Finance, Taxation, And Monetary Policy',
      'Railroad Transportation',
      'Real Estate',
      'Rubber And Miscellaneous Plastics Products',
      'Security And Commodity Brokers, Dealers, Exchanges, And Services',
      'Social Services',
      'Stone, Clay, Glass, And Concrete Products',
      'Textile Mill Products',
      'Tobacco Products',
      'Transportation By Air',
      'Transportation Equipment',
      'Transportation Services',
      'United States Postal Service',
      'Water Transportation',
      'Wholesale Trade-Durable Goods',
      'Wholesale Trade-Non-Durable Goods',
      '#N/A'
    ]
    {
      menu: generate_menu(menu_items),
      menu_select: menu_items.sample,
      loss_ratio: rand,
      total_policies: rand(0..5000),
      total_policies_with_claims: rand(0..500)
    }
  end

  def loss_experience
    menu_items = [' / ', 'EPLI/NFP', 'EPLI/PRIVATE', 'DO/PRIVATE', 'DO/NFP']
    {
      menu: generate_menu(menu_items),
      menu_select: menu_items.sample,
      loss_ratio: rand,
      total_policies: rand(0..5000),
      total_policies_with_claims: rand,
      rate_needed_14: rand,
      target_loss_ratio: rand,
      year: '2007 - 2012'
    }
  end

  def state
    menu_items = %w(AK AL AR AZ CA CO CT DC DE FL GA HI IA ID IL IN KS KY LA MA MD ME MI MN MO MS MT NC ND NE NH
                    NJ NM NV NY OH OK OR PA RI SC SD TN TX UT VA VT WA WI WV WY Missing)

    {
      menu: generate_menu(menu_items),
      menu_select: menu_items.sample,
      loss_ratio: rand,
      total_policies: rand(0..5000),
      total_policies_with_claims: rand(0..500)
    }
  end

  def size_of_company
    menu_items = ['0M - 0.25M', '0.25M - 1.2M', '1.2M - 5M', '5M - 25M', '25M - 1000000000M', 'Missing']
    {
      menu: generate_menu(menu_items),
      menu_select: menu_items.sample,
      loss_ratio: rand,
      total_policies: rand(0..5000),
      total_policies_with_claims: rand(0..500)
    }
  end

  def number_of_employees
    menu_items = ['1 - 4', '4 - 9', '10 - 19', '20 - 49', '50 - 99', '100 - 249', '250 - 499', '500 - 999',
                  '999 - 1000000000', 'Missing']
    {
      menu: generate_menu(menu_items),
      menu_select: menu_items.sample,
      loss_ratio: rand,
      total_policies: rand(0..5000),
      total_policies_with_claims: rand(0..500)
    }
  end

  def financial_health
    menu_items = ['1 - 4', '10 - 19', '20 - 49', '100 - 249', '250 - 499']
    {
      loss_ratio: rand,
      menu: generate_menu(menu_items),
      menu_select: menu_items[0],
      total_policies: rand(0..5000),
      total_policies_with_claims: rand(0..500),
      industry_average: rand(0..5000),
      financial_stress_score: rand(0..2000)
    }
  end
end
