RSpec.shared_examples 'subfactor with range' do |klass, subfactor, low, high|
  it "#{klass}##{subfactor} defaults to 1 when not between #{low} and #{high}" do
    renewal = build(:renewal_business, subfactor => high + 1)
    factor = klass.new(:company, :sic, renewal)
    expect(factor.send(subfactor)).to eql(1)
  end

  it "#{klass}##{subfactor} returns the renewal factor when between #{low} and #{high}" do
    renewal = build(:renewal_business)
    factor = klass.new(:company, :sic, renewal)
    expect(factor.send(subfactor).to_f).to eq(renewal.send(subfactor).to_f)
  end

  it "#{klass}##{subfactor} defaults to 1 when renewal is nil" do
    factor = klass.new(:company, :sic, nil)
    expect(factor.send(subfactor)).to eql(1)
  end
end

RSpec.shared_examples 'subfactor without range' do |klass, subfactor|
  it "#{klass}##{subfactor} defaults to 1 when below 1" do
    renewal = build(:renewal_business, subfactor => 0.8)
    factor = klass.new(:company, :sic, renewal)
    expect(factor.send(subfactor)).to eql(1)
  end

  it "#{klass}##{subfactor} returns the renewal factor" do
    renewal = build(:renewal_business)
    factor = klass.new(:company, :sic, renewal)
    expect(factor.send(subfactor).to_f).to eq(renewal.send(subfactor).to_f)
  end

  it "#{klass}##{subfactor} defaults to 1 when renewal is nil" do
    factor = klass.new(:company, :sic, nil)
    expect(factor.send(subfactor)).to eql(1)
  end
end
