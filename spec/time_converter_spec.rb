# frozen_string_literal: true

require_relative '../lib/time_converter'
require 'rspec'

RSpec.describe "TimeConverter" do
  include TimeConverter

  it "converts from seconds to minutes" do
    expect(convert_time(3600, :s, :min)).to be_within(0.001).of(60)
  end

  it "converts from minutes to hours" do
    expect(convert_time(120, :min, :hr)).to be_within(0.001).of(2)
  end

  it "converts from hours to days" do
    expect(convert_time(48, :hr, :day)).to be_within(0.001).of(2)
  end
end
