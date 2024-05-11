# frozen_string_literal: true
require_relative 'converter'

module PressureConverter
  PASCAL = :pascal
  ATMOSPHERE = :atmosphere
  MMHG = :mmHg

  CONVERSIONS = {
    PASCAL => { PASCAL => 1, ATMOSPHERE => 0.00000986923, MMHG => 0.00750062 },
    ATMOSPHERE => { PASCAL => 101_325, ATMOSPHERE => 1, MMHG => 760 },
    MMHG => { PASCAL => 133.322, ATMOSPHERE => 0.00131579, MMHG => 1 }
  }.freeze

  def convert_pressure(value, from_unit, to_unit)
    Converter.convert(value, from_unit, to_unit, CONVERSIONS)
  end
end
