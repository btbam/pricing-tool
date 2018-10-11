require 'rails_helper'

RSpec.describe MassModels do
  let!(:model_prefix) { 'TestClass' }
  let!(:model_date) { Date.new(2015, 1) }
  let!(:model_klass) { "#{model_prefix}#{model_date.strftime('%Y%m')}" }
  let!(:one_offs) { [Date.new(2014, 7)] }
  let!(:one_off_klass) { "#{model_prefix}#{one_offs.first.strftime('%Y%m')}" }

  let(:table_prefix) { 'test_class_' }
  let(:parent_klass) { TestClassBase }
  let(:opts) do
    {
      model_prefix: model_prefix,
      table_prefix: table_prefix,
      parent_klass: parent_klass,
      start_date: model_date,
      one_offs: one_offs
    }
  end
  let(:mass_models) { MassModels.new(opts) }

  before do
    allow_any_instance_of(Date).to receive(:beginning_of_month).and_return(model_date + 1.month)
    class TestClassBase
      class << self
        attr_accessor :table_name
      end
    end
  end

  after do
    # rubocop:disable Style/RescueModifier
    Object.send(:remove_const, model_klass) rescue nil
    Object.send(:remove_const, one_off_klass) rescue nil
    # rubocop:enable Style/RescueModifier
  end

  it 'can be initialized with all options' do
    expect(mass_models).to be_a(MassModels)
  end

  describe '#create' do
    before do
      mass_models.create
    end

    it 'creates standard date models' do
      expect(model_klass.constantize).to be_a(Class)
    end

    it 'creates one-off models' do
      expect(one_off_klass.constantize).to be_a(Class)
    end
  end

  context 'private methods' do
    describe '#create_one_off_models' do
      it 'creates one-off models' do
        mass_models.send(:create_one_off_models)
        expect(one_off_klass.constantize).to be_a(Class)
      end
    end

    describe '#create_standard_date_models' do
      it 'creates standard date models' do
        mass_models.send(:create_standard_date_models)
        expect(model_klass.constantize).to be_a(Class)
      end
    end

    describe '#create_model_by_date' do
      let!(:model_date) { Date.new(1999, 12) }
      let!(:model_klass) { "#{model_prefix}#{model_date.strftime('%Y%m')}" }

      after do
        Object.send(:remove_const, model_klass) rescue nil # rubocop:disable Style/RescueModifier
      end

      it 'creates a model with a name using the table prefix and date' do
        mass_models.send(:create_model_by_date, model_date)
        expect(model_klass.constantize).to be_a(Class)
      end
    end

    describe '#create_model' do
      it 'dynamically creates a model using klass_name' do
        mass_models.send(:create_model, model_klass, nil)
        expect(model_klass.constantize).to be_a(Class)
      end

      it 'sets table_name on the new model' do
        table_name =  "#{table_prefix}testing"
        mass_models.send(:create_model, model_klass, table_name)
        expect(model_klass.constantize).to be_a(Class)
        expect(model_klass.constantize.table_name).to eql(table_name)
      end
    end
  end
end
