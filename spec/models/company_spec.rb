require 'rails_helper'

RSpec.describe Company do
  let(:attributes) do
    { foo: 'bar',
      baz: 'qux' }
  end

  it 'can be initialized' do
    expect(Company.new).to be_a(Company)
  end

  it 'has attributes' do
    company = Company.new(attributes)
    expect(company.attributes).to eql(attributes)
  end

  it 'dynamically creates and initializes attr_accessors' do
    company = Company.new(attributes)
    expect(company.foo).to eql('bar')
    expect(company.baz).to eql('qux')
  end
end
