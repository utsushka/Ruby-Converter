# frozen_string_literal: true
require_relative 'converter'

module KitchenUnitsConverter
  TEA_SPOON = :tsp
  TABLE_SPOON = :tbsp
  CUP = :cup

  CONVERSIONS = {
    TEA_SPOON => { TEA_SPOON => 1, TABLE_SPOON => 0.333333, CUP => 0.0208333 },
    TABLE_SPOON => { TEA_SPOON => 3, TABLE_SPOON => 1, CUP => 0.0625 },
    CUP => { TEA_SPOON => 48, TABLE_SPOON => 16, CUP => 1 }
  }.freeze

  def self.convert_kitchen_units(value, from_unit, to_unit)
    Converter.convert(value, from_unit, to_unit, CONVERSIONS)
  end
end
