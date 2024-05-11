# frozen_string_literal: true

require_relative '../lib/ruby_converter/length_converter'
require 'rspec'

RSpec.describe "LengthConverter" do
  include LengthConverter

  it "converts from millimeters to centimeters" do
    expect(convert_length(100, :mm, :cm)).to eq(10)
  end

  it "converts from meters to kilometers" do
    expect(convert_length(2000, :m, :km)).to eq(2)
  end

  it "converts from inches to feet" do
    expect(convert_length(36, :in, :ft)).to eq(2.999999)
  end
end
