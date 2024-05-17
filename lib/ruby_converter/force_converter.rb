# frozen_string_literal: true

require_relative 'converter'

module ForceConverter
  NEWTON = :newton
  KILOGRAM_FORCE = :kilogram_force
  POUND_FORCE = :pound_force

  CONVERSIONS = {
    'newton_to_newton' => ->(value) { value * 1 },
    'newton_to_kilogram_force' => ->(value) { value * 0.101972 },
    'newton_to_pound_force' => ->(value) { value * 0.224809 },

    'kilogram_force_to_newton' => ->(value) { value * 9.80665 },
    'kilogram_force_to_kilogram_force' => ->(value) { value * 1 },
    'kilogram_force_to_pound_force' => ->(value) { value * 2.20462 },

    'pound_force_to_newton' => ->(value) { value * 4.44822 },
    'pound_force_to_kilogram_force' => ->(value) { value * 0.453592 },
    'pound_force_to_pound_force' => ->(value) { value * 1 }
  }.freeze

  def self.convert_force(value, from_unit, to_unit)
    Converter.convert(value, from_unit.to_s, to_unit.to_s, CONVERSIONS, 6)
  end
end
