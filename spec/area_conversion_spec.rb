# frozen_string_literal: true

require_relative '../lib/ruby_converter/area_converter'
require 'rspec'

RSpec.describe "Area conversion" do
  it "converts square meters to square feet" do
    expect(AreaConverter.convert_area(1, :sq_m, :sq_ft)).to be_within(0.01).of(10.7639)
  end

  it "converts square kilometers to square meters" do
    expect(AreaConverter.convert_area(1, :sq_km, :sq_m)).to be_within(1).of(1_000_000)
  end

  it "returns nil for unsupported conversion" do
    expect(AreaConverter.convert_area(1, :unsupported_unit, :sq_m)).to be_nil
  end
end
