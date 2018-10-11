require 'rails_helper'
require 'support/calculator_helper'

RSpec.describe CalculatorApi::DnoFactors::PrivateCompany do
  describe '#initialize' do
    let(:factor) { CalculatorApi::DnoFactors::PrivateCompany.new(nil, nil, nil) }

    it 'sets dno_percent_private_stock' do
      expect(factor.dno_percent_private_stock).not_to be_nil
    end

    it 'sets esop_ownership' do
      expect(factor.esop_ownership).not_to be_nil
    end

    it 'sets ipo' do
      expect(factor.ipo).not_to be_nil
    end

    it 'sets private_placement' do
      expect(factor.private_placement).not_to be_nil
    end

    it 'sets nonentity_epli' do
      expect(factor.nonentity_epli).not_to be_nil
    end

    it 'sets board_auditor' do
      expect(factor.board_auditor).not_to be_nil
    end

    it 'sets public_debt' do
      expect(factor.public_debt).not_to be_nil
    end
  end

  describe '#process_factor' do
    include_examples 'subfactor with range',
                     CalculatorApi::DnoFactors::PrivateCompany, :dno_percent_private_stock, 0.8, 1
    include_examples 'subfactor with range', CalculatorApi::DnoFactors::PrivateCompany, :esop_ownership, 1, 1.5
    include_examples 'subfactor without range', CalculatorApi::DnoFactors::PrivateCompany, :ipo
    include_examples 'subfactor without range', CalculatorApi::DnoFactors::PrivateCompany, :private_placement
    include_examples 'subfactor without range', CalculatorApi::DnoFactors::PrivateCompany, :nonentity_epli
    include_examples 'subfactor without range', CalculatorApi::DnoFactors::PrivateCompany, :board_auditor
    include_examples 'subfactor without range', CalculatorApi::DnoFactors::PrivateCompany, :public_debt
  end
end
