# frozen_string_literal: true

require_relative '../lib/ruby_converter/speed_converter'
require 'rspec'

RSpec.describe "SpeedConverter" do
  include SpeedConverter

  it "converts from kilometers per hour to miles per hour" do
    expect(convert_speed(100, :km_h, :mph)).to eq(62.1371)
  end

  it "converts from miles per hour to meters per second" do
    expect(convert_speed(60, :mph, :m_s)).to eq(26.8224)
  end

  it "converts from meters per second to kilometers per hour" do
    expect(convert_speed(10, :m_s, :km_h)).to eq(36)
  end
end
