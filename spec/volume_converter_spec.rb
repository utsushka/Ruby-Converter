# frozen_string_literal: true

require_relative '../lib/ruby_converter/volume_converter'
require 'rspec'

RSpec.describe "VolumeConverter" do
  it "converts from milliliters to liters" do
    expect(VolumeConverter.convert_volume(1000, :ml, :l)).to be_within(0.01).of(1)
  end

  it "converts from liters to gallons" do
    expect(VolumeConverter.convert_volume(3.78541, :l, :gal)).to be_within(0.01).of(1)
  end

  it "converts from cups to milliliters" do
    expect(VolumeConverter.convert_volume(1, :cup, :ml)).to be_within(0.01).of(236.588)
  end

  it "converts from liters to milliliters" do
    expect(VolumeConverter.convert_volume(2, :l, :ml)).to be_within(0.01).of(2000)
  end

  it "converts from gallons to liters" do
    expect(VolumeConverter.convert_volume(1, :gal, :l)).to be_within(0.01).of(3.78541)
  end

  it "converts from milliliters to cups" do
    expect(VolumeConverter.convert_volume(1000, :ml, :cup)).to be_within(0.01).of(4.22675)
  end
end
