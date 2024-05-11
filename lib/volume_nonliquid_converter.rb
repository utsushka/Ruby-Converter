# frozen_string_literal: true
require_relative 'converter'

module VolumeNonliquidConverter
  CUBIC_M = :cubic_m
  LITERS = :liters
  CUBIC_FT = :cubic_ft
  CUBIC_IN = :cubic_in

  CONVERSIONS = {
    CUBIC_M => { CUBIC_M => 1, LITERS => 1000, CUBIC_FT => 35.3147, CUBIC_IN => 61_023.7 },
    LITERS => { CUBIC_M => 0.001, LITERS => 1, CUBIC_FT => 0.0353147, CUBIC_IN => 61.0237 },
    CUBIC_FT => { CUBIC_M => 0.0283168, LITERS => 28.3168, CUBIC_FT => 1, CUBIC_IN => 1728 },
    CUBIC_IN => { CUBIC_M => 0.0000163871, LITERS => 0.0163871, CUBIC_FT => 0.000578704, CUBIC_IN => 1 }
  }.freeze

  def convert_volume_nonliquid(value, from_unit, to_unit)
    Converter.convert(value, from_unit, to_unit, CONVERSIONS)
  end
end
