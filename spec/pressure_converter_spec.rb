# frozen_string_literal: true

require_relative '../lib/ruby_converter/pressure_converter'
require_relative '../lib/ruby_converter/converter'
require 'rspec'

RSpec.describe "PressureConverter" do
  it "converts from pascals to atmospheres" do
    expect(PressureConverter.convert_pressure(101325, :pascal, :atmosphere)).to eq(1)
  end

  it "converts from atmospheres to mmHg" do
    expect(PressureConverter.convert_pressure(1, :atmosphere, :mmHg)).to eq(760)
  end

  it "converts from mmHg to pascals" do
    expect(PressureConverter.convert_pressure(760, :mmHg, :pascal)).to be_within(0.01).of(101324.72)
  end
end
