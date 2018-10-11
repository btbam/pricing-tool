require 'rails_helper'

RSpec.describe CalculatorApi::DnoFactors::SpecialtyCoverage do
  describe '#initialize' do
    let(:factor) { CalculatorApi::DnoFactors::SpecialtyCoverage.new(nil, nil, nil) }

    it 'sets punitive_damages' do
      expect(factor.punitive_damages).not_to be_nil
    end

    it 'sets prior_acts' do
      expect(factor.prior_acts).not_to be_nil
    end
  end

  describe '#process_factor' do
    let(:renewal) { build(:renewal_business) }
    let(:factor) { CalculatorApi::DnoFactors::SpecialtyCoverage.new(:company, :sic, renewal) }

    context 'punitive_damages' do
      it 'calculates' do
        expect(factor.punitive_damages).to eq(renewal.punitive_damages.to_f)
      end

      it 'defaults to 1 when renewal is nil' do
        factor = CalculatorApi::DnoFactors::SpecialtyCoverage.new(:company, :sic, nil)
        expect(factor.punitive_damages).to eql(1)
      end

      it 'defaults to 1 when not between 1 and 1.4' do
        renewal = build(:renewal_business, punitive_damages: 0.8)
        factor = CalculatorApi::DnoFactors::SpecialtyCoverage.new(:company, :sic, renewal)
        expect(factor.punitive_damages).to eql(1)
      end
    end

    context 'prior_acts' do
      it 'calculates' do
        expect(factor.prior_acts).to eq(renewal.prior_acts.to_f)
      end

      it 'defaults to 1 when renewal is nil' do
        factor = CalculatorApi::DnoFactors::SpecialtyCoverage.new(:company, :sic, nil)
        expect(factor.prior_acts).to eql(1)
      end

      it 'defaults to 1 when not between 0.7 and 1' do
        renewal = build(:renewal_business, prior_acts: 2)
        factor = CalculatorApi::DnoFactors::SpecialtyCoverage.new(:company, :sic, renewal)
        expect(factor.prior_acts).to eql(1)
      end
    end
  end
end
