# frozen_string_literal: true

require_relative 'converter'

module KitchenUnitsConverter
  TEA_SPOON = :tsp
  TABLE_SPOON = :tbsp
  CUP = :cup

  CONVERSIONS = {
    'tsp_to_tsp' => ->(value) { value * 1 },
    'tsp_to_tbsp' => ->(value) { value * 0.333333 },
    'tsp_to_cup' => ->(value) { value * 0.0208333 },

    'tbsp_to_tsp' => ->(value) { value * 3 },
    'tbsp_to_tbsp' => ->(value) { value * 1 },
    'tbsp_to_cup' => ->(value) { value * 0.0625 },

    'cup_to_tsp' => ->(value) { value * 48 },
    'cup_to_tbsp' => ->(value) { value * 16 },
    'cup_to_cup' => ->(value) { value * 1 }
  }.freeze

  def self.convert_kitchen_units(value, from_unit, to_unit)
    Converter.convert(value, from_unit.to_s, to_unit.to_s, CONVERSIONS, 15)
  end
end
