# frozen_string_literal: true

require_relative '../lib/energy_converter'
require 'rspec'

RSpec.describe "Energy conversion" do
  it "converts joules to kilocalories" do
    expect(EnergyConverter.convert_energy(1, :joule, :kilocalorie)).to be_within(0.001).of(0.000239)
  end

  it "converts watt hours to joules" do
    expect(EnergyConverter.convert_energy(1, :watt_hour, :joule)).to be_within(0.001).of(3600)
  end
end
