# frozen_string_literal: true

require_relative '../lib/ruby_converter/weight_converter'
require 'rspec'

RSpec.describe "WeightConverter" do
  it "converts from milligrams to grams" do
    expect(WeightConverter.convert_weight(1000, :mg, :g)).to be_within(0.001).of(1)
  end

  it "converts from kilograms to pounds" do
    expect(WeightConverter.convert_weight(0.453592, :kg, :lb)).to be_within(0.001).of(1)
  end

  it "converts from ounces to milligrams" do
    expect(WeightConverter.convert_weight(1, :oz, :mg)).to be_within(0.001).of(28349.5)
  end
end
