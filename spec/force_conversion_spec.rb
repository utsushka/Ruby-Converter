# frozen_string_literal: true

require_relative '../lib/ruby_converter/force_converter'
require 'rspec'

RSpec.describe "Force conversion" do
  it "converts newtons to kilogram-force" do
    expect(ForceConverter.convert_force(1, :newton, :kilogram_force)).to be_within(0.000001).of(0.101972)
  end

  it "converts kilogram-force to pound-force" do
    expect(ForceConverter.convert_force(1, :kilogram_force, :pound_force)).to be_within(0.000001).of(2.20462)
  end

  it "converts pound-force to newtons" do
    expect(ForceConverter.convert_force(1, :pound_force, :newton)).to be_within(0.000001).of(4.44822)
  end
end