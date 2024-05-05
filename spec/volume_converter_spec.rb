# frozen_string_literal: true

require_relative '../lib/volume_converter'
require 'rspec'

RSpec.describe "VolumeConverter" do
  include VolumeConverter

  it "converts from milliliters to liters" do
    expect(convert_volume(1000, :ml, :l)).to be_within(0.001).of(1)
  end

  it "converts from liters to gallons" do
    expect(convert_volume(3.78541, :l, :gal)).to be_within(0.001).of(1)
  end

  it "converts from cups to milliliters" do
    expect(convert_volume(1, :cup, :ml)).to be_within(0.001).of(236.588)
  end
end
