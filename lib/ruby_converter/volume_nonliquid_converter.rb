# frozen_string_literal: true

require_relative 'converter'

module VolumeNonliquidConverter
  CUBIC_M = 'cubic_m'
  LITERS = 'liters'
  CUBIC_FT = 'cubic_ft'
  CUBIC_IN = 'cubic_in'

  CONVERSIONS = {
    "#{CUBIC_M}_to_#{CUBIC_M}" => ->(value) { value * 1 },
    "#{CUBIC_M}_to_#{LITERS}" => ->(value) { value * 1000 },
    "#{CUBIC_M}_to_#{CUBIC_FT}" => ->(value) { value * 35.3147 },
    "#{CUBIC_M}_to_#{CUBIC_IN}" => ->(value) { value * 61_023.7 },

    "#{LITERS}_to_#{CUBIC_M}" => ->(value) { value * 0.001 },
    "#{LITERS}_to_#{LITERS}" => ->(value) { value * 1 },
    "#{LITERS}_to_#{CUBIC_FT}" => ->(value) { value * 0.0353147 },
    "#{LITERS}_to_#{CUBIC_IN}" => ->(value) { value * 61.0237 },

    "#{CUBIC_FT}_to_#{CUBIC_M}" => ->(value) { value * 0.0283168 },
    "#{CUBIC_FT}_to_#{LITERS}" => ->(value) { value * 28.3168 },
    "#{CUBIC_FT}_to_#{CUBIC_FT}" => ->(value) { value * 1 },
    "#{CUBIC_FT}_to_#{CUBIC_IN}" => ->(value) { value * 1728 },

    "#{CUBIC_IN}_to_#{CUBIC_M}" => ->(value) { value * 0.0000163871 },
    "#{CUBIC_IN}_to_#{LITERS}" => ->(value) { value * 0.0163871 },
    "#{CUBIC_IN}_to_#{CUBIC_FT}" => ->(value) { value * 0.000578704 },
    "#{CUBIC_IN}_to_#{CUBIC_IN}" => ->(value) { value * 1 }
  }.freeze

  def self.convert_volume_nonliquid(value, from_unit, to_unit)
    Converter.convert(value, from_unit.to_s, to_unit.to_s, CONVERSIONS, 6)
  end
end
