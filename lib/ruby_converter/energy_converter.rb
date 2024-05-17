# frozen_string_literal: true

require_relative 'converter'

module EnergyConverter
  JOULE = :joule
  KILOCALORIE = :kilocalorie
  WATT_HOUR = :watt_hour

  CONVERSIONS = {
    'joule_to_joule' => ->(value) { value * 1 },
    'joule_to_kilocalorie' => ->(value) { value * 0.000239006 },
    'joule_to_watt_hour' => ->(value) { value * 0.000277778 },

    'kilocalorie_to_joule' => ->(value) { value * 4184 },
    'kilocalorie_to_kilocalorie' => ->(value) { value * 1 },
    'kilocalorie_to_watt_hour' => ->(value) { value * 1.16222 },

    'watt_hour_to_joule' => ->(value) { value * 3600 },
    'watt_hour_to_kilocalorie' => ->(value) { value * 0.860421 },
    'watt_hour_to_watt_hour' => ->(value) { value * 1 }
  }.freeze

  def self.convert_energy(value, from_unit, to_unit, round = 6)
    Converter.convert(value, from_unit.to_s, to_unit.to_s, CONVERSIONS, round)
  end
end
