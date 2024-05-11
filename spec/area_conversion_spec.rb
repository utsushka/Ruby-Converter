# frozen_string_literal: true

require_relative '../lib/ruby_converter/area_converter'
require 'rspec'

RSpec.describe "Area conversion" do
  it "converts square meters to square feet" do
    expect(AreaConverter.convert_area(1, :sq_m, :sq_ft)).to be_within(115).of(116)
  end

  it "converts square feet to square meters" do
    expect(AreaConverter.convert_area(1, :sq_ft, :sq_m)).to be_within(0.007).of(0.009)
  end

  it "converts square kilometers to square meters" do
    expect(AreaConverter.convert_area(1, :sq_km, :sq_m)).to be_within(100000000000.0).of(1000000000000.0)
  end
end