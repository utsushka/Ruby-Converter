# frozen_string_literal: true

require_relative '../lib/volume_nonliquid_converter'
require 'rspec'

RSpec.describe "VolumeNonliquidConverter" do
  include VolumeNonliquidConverter

  it "converts from cubic meters to cubic feet" do
    expect(convert_volume_nonliquid(1, :cubic_m, :cubic_ft)).to be_within(0.001).of(35.3147)
  end

  it "converts from liters to cubic inches" do
    expect(convert_volume_nonliquid(1, :liters, :cubic_in)).to be_within(0.001).of(61.0237)
  end

  it "converts from cubic inches to cubic meters" do
    expect(convert_volume_nonliquid(1, :cubic_in, :cubic_m)).to be_within(0.001).of(0.0000163871)
  end
end
