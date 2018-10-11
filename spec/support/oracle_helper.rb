RSpec.shared_context 'oracle dnb data' do
  let!(:oracle_smad) do
    oracle_smad = OpenStruct.new(
    duns_number: Faker::Company.duns_number.tr('^0-9', '').to_i,
    base_dat: '01012014',
    sales: (0..100_000).to_a.sample,
    incorpdt: '01012015',
    dmdisbus: %w(y n).sample,
    emphere: (1..5000).to_a.sample,
    emptotl: (1..5000).to_a.sample,
    state_ph: Faker::Address.state_abbr,
    as_of_dt: Time.now)

    oracle_smad.attributes = Hash[ImporterHelper::Oracle::Smad.new.select_columns.map do |column|
      [column, oracle_smad.send(column.to_sym)]
    end]

    oracle_smad
  end

  let!(:oracle_csad) do
    oracle_csad = OpenStruct.new(
    duns_number: Faker::Company.duns_number.tr('^0-9', '').to_i,
    yrstart: (1900..Time.now.year).to_a.sample,
    fspoints: (1000..1800).to_a.sample,
    ob_ind: [1, 0].sample,
    cscore: (1..5).to_a.sample,
    cpoints: (1000..1800).to_a.sample,
    fscore: (1..5).to_a.sample,
    cond_ind: ImporterHelper::Oracle::CONDITION_VALUES.keys.sample,
    telephone_number: Faker::PhoneNumber.phone_number,
    networth: (0..100_000).to_a.sample,
    pubpvt: %w(s n).sample,
    as_of_dt: Time.now)

    oracle_csad.attributes = Hash[ImporterHelper::Oracle::Csad.new.select_columns.map do |column|
      [column, oracle_csad.send(column.to_sym)]
    end]

    oracle_csad
  end
end
