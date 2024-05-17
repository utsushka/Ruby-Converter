# frozen_string_literal: true

require_relative '../lib/ruby_converter/length_converter'
require 'rspec'

RSpec.describe "LengthConverter" do
  it "converts from millimeters to centimeters" do
    expect(LengthConverter.convert_length(100, :mm, :cm)).to eq(10)
  end

  it "converts from meters to kilometers" do
    expect(LengthConverter.convert_length(2000, :m, :km)).to eq(2)
  end

  it "converts from inches to feet" do
    expect(LengthConverter.convert_length(36, :in, :ft)).to be_within(0.000001).of(3)
  end
end
