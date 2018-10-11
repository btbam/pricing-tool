require 'support/api_helper'
require 'support/oracle_helper'

RSpec.describe DatabaseFallback::PgOracle::Record do
  describe 'process_result' do
    let!(:company_info) { FactoryGirl.build(:company_info) }

    it 'process_result with a up to date record' do
      company_info.object_state = 'a'
      expect(Digest::MD5).to receive(:hexdigest).and_return('a')
      expect(company_info).to_not receive(:save)

      DatabaseFallback::PgOracle::Record.process_result(company_info)
    end

    context 'when oracle dnb data is available' do
      include_context 'oracle dnb data'

      it 'process_result with an out of date record' do
        company_info.object_state = 'b'
        expect(Digest::MD5).to receive(:hexdigest).and_return('a').twice
        expect(OracleSmad).to receive_message_chain(:select, :where, :where, :limit).and_return([oracle_smad])
        expect(OracleCsad).to receive_message_chain(:select, :where, :where, :limit).and_return([oracle_csad])
        expect(company_info).to receive(:save)

        DatabaseFallback::PgOracle::Record.process_result(company_info)

        ImporterHelper::Oracle::Smad.new.convert_fields.each do |_oracle, pg|
          expect(company_info.send(pg)).to_not be_nil
        end

        ImporterHelper::Oracle::Smad.new.convert_fields.each do |_oracle, pg|
          expect(company_info.send(pg)).to_not be_nil
        end
      end
    end
  end
end
