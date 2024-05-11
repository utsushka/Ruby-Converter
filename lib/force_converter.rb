# frozen_string_literal: true
require_relative 'converter'

module ForceConverter
  NEWTON = :newton
  KILOGRAM_FORCE = :kilogram_force
  POUND_FORCE = :pound_force

  CONVERSIONS = {
    NEWTON => { NEWTON => 1, KILOGRAM_FORCE => 0.101972, POUND_FORCE => 0.224809 },
    KILOGRAM_FORCE => { NEWTON => 9.80665, KILOGRAM_FORCE => 1, POUND_FORCE => 2.20462 },
    POUND_FORCE => { NEWTON => 4.44822, KILOGRAM_FORCE => 0.453592, POUND_FORCE => 1 }
  }.freeze

  def self.convert_force(value, from_unit, to_unit)
    Converter.convert(value, from_unit, to_unit, CONVERSIONS)
  end
end
