# frozen_string_literal: true

require_relative 'converter'

module WeightConverter
  MG = :mg
  G = :g
  KG = :kg
  OZ = :oz
  LB = :lb

  CONVERSIONS = {
    "#{MG}_to_#{MG}" => ->(value) { value * 1 },
    "#{MG}_to_#{G}" => ->(value) { value * 0.001 },
    "#{MG}_to_#{KG}" => ->(value) { value * 0.000001 },
    "#{MG}_to_#{OZ}" => ->(value) { value * 0.000035274 },
    "#{MG}_to_#{LB}" => ->(value) { value * 0.00000220462 },

    "#{G}_to_#{MG}" => ->(value) { value * 1000 },
    "#{G}_to_#{G}" => ->(value) { value * 1 },
    "#{G}_to_#{KG}" => ->(value) { value * 0.001 },
    "#{G}_to_#{OZ}" => ->(value) { value * 0.035274 },
    "#{G}_to_#{LB}" => ->(value) { value * 0.00220462 },

    "#{KG}_to_#{MG}" => ->(value) { value * 1_000_000 },
    "#{KG}_to_#{G}" => ->(value) { value * 1000 },
    "#{KG}_to_#{KG}" => ->(value) { value * 1 },
    "#{KG}_to_#{OZ}" => ->(value) { value * 35.274 },
    "#{KG}_to_#{LB}" => ->(value) { value * 2.20462 },

    "#{OZ}_to_#{MG}" => ->(value) { value * 28_349.5 },
    "#{OZ}_to_#{G}" => ->(value) { value * 28.3495 },
    "#{OZ}_to_#{KG}" => ->(value) { value * 0.0283495 },
    "#{OZ}_to_#{OZ}" => ->(value) { value * 1 },
    "#{OZ}_to_#{LB}" => ->(value) { value * 0.0625 },

    "#{LB}_to_#{MG}" => ->(value) { value * 453_592 },
    "#{LB}_to_#{G}" => ->(value) { value * 453.592 },
    "#{LB}_to_#{KG}" => ->(value) { value * 0.453592 },
    "#{LB}_to_#{OZ}" => ->(value) { value * 16 },
    "#{LB}_to_#{LB}" => ->(value) { value * 1 }
  }.freeze

  def self.convert_weight(value, from_unit, to_unit)
    Converter.convert(value, from_unit.to_s, to_unit.to_s, CONVERSIONS, 8)
  end
end
