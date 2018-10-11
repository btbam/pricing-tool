require 'rails_helper'

RSpec.describe CalculatorApi::DnoFactors::Litigation do
  describe '#initialize' do
    let(:litigation) { CalculatorApi::DnoFactors::Litigation.new(nil, nil, nil) }

    it 'sets litigation_ex_dno' do
      expect(litigation.litigation_ex_dno).not_to be_nil
    end

    it 'sets litigation' do
      expect(litigation.litigation).not_to be_nil
    end
  end

  describe '#process_factor' do
    let(:renewal) { build(:renewal_business) }

    context 'litigation_ex_dno' do
      it 'calculates' do
        factor = CalculatorApi::DnoFactors::Litigation.new(:company, :sic, renewal)
        expect(factor.litigation_ex_dno).to eq(renewal.litigation_ex_dno)
      end

      it 'defaults to 1 when renewal is nil' do
        factor = CalculatorApi::DnoFactors::Litigation.new(:company, :sic, nil)
        expect(factor.litigation_ex_dno).to eql(1)
      end
    end

    context 'litigation' do
      it 'calculates' do
        factor = CalculatorApi::DnoFactors::Litigation.new(:company, :sic, renewal)
        expect(factor.litigation).to eq(renewal.litigation)
      end

      it 'defaults to 1 when renewal is nil' do
        factor = CalculatorApi::DnoFactors::Litigation.new(:company, :sic, nil)
        expect(factor.litigation).to eql(1)
      end
    end

    context 'litigation factor' do
      it 'defaults to 1 when renewal is nil' do
        factor = CalculatorApi::DnoFactors::Litigation.new(:company, :sic, nil)
        expect(factor.factor).to eql(1)
      end

      it 'returns renewal factor when between 1 and 1.3' do
        factor = CalculatorApi::DnoFactors::Litigation.new(:company, :sic, renewal)
        expect(factor.factor).to eq(renewal.litigation_factor)
      end

      it 'returns 1 when not between 1 and 1.3' do
        renewal = build(:renewal_business, litigation_factor: 0.8)
        factor = CalculatorApi::DnoFactors::Litigation.new(:company, :sic, renewal)
        expect(factor.factor).to eql(1)
      end
    end
  end
end
