# frozen_string_literal: true

require_relative '../lib/ruby_converter/kitchen_units_converter'
require 'rspec'

RSpec.describe "KitchenUnitsConverter" do
  include KitchenUnitsConverter

  it "converts from teaspoons to tablespoons" do
    expect(convert_kitchen_units(1, :tsp, :tbsp)).to be_within(0.001).of(0.333333)
  end

  it "converts from tablespoons to cups" do
    expect(convert_kitchen_units(1, :tbsp, :cup)).to be_within(0.001).of(0.0625)
  end

  it "converts from cups to teaspoons" do
    expect(convert_kitchen_units(1, :cup, :tsp)).to be_within(0.001).of(48)
  end
end
