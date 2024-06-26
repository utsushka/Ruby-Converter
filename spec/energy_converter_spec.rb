# frozen_string_literal: true

require_relative '../lib/ruby_converter/energy_converter'
require 'rspec'

RSpec.describe "Energy conversion" do
  it "converts joules to kilocalories" do
    expect(EnergyConverter.convert_energy(1, :joule, :kilocalorie)).to be_within(0.000001).of(0.000239)
  end

  it "converts watt hours to joules" do
    expect(EnergyConverter.convert_energy(1, :watt_hour, :joule)).to be_within(0.1).of(3600)
  end

  it "returns nil for unsupported conversion" do
    expect(EnergyConverter.convert_energy(1, :unsupported_unit, :joule)).to be_nil
  end
end
