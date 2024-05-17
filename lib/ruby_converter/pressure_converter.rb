# frozen_string_literal: true

module PressureConverter
  PASCAL = :pascal
  ATMOSPHERE = :atmosphere
  MMHG = :mmHg

  CONVERSIONS = {
    'pascal_to_pascal' => ->(value) { value * 1 },
    'pascal_to_atmosphere' => ->(value) { value * 0.00000986923 },
    'pascal_to_mmHg' => ->(value) { value * 0.00750062 },

    'atmosphere_to_pascal' => ->(value) { value * 101_325 },
    'atmosphere_to_atmosphere' => ->(value) { value * 1 },
    'atmosphere_to_mmHg' => ->(value) { value * 760 },

    'mmHg_to_pascal' => ->(value) { value * 133.322 },
    'mmHg_to_atmosphere' => ->(value) { value * 0.00131579 },
    'mmHg_to_mmHg' => ->(value) { value * 1 }
  }.freeze

  def self.convert_pressure(value, from_unit, to_unit)
    Converter.convert(value, from_unit.to_s, to_unit.to_s, CONVERSIONS)
  end
end
