# frozen_string_literal: true

class Converter
  def self.convert(value, from_unit, to_unit, conversions)
    (value.to_f * conversions[from_unit][to_unit] / conversions[to_unit][from_unit]).round(6)
  end
end