# frozen_string_literal: true

module EnergyConverter
  JOULE = :joule
  KILOCALORIE = :kilocalorie
  WATT_HOUR = :watt_hour

  CONVERSIONS = {
    JOULE => { JOULE => 1, KILOCALORIE => 0.000239006, WATT_HOUR => 0.000277778 },
    KILOCALORIE => { JOULE => 4184, KILOCALORIE => 1, WATT_HOUR => 1.16222 },
    WATT_HOUR => { JOULE => 3600, KILOCALORIE => 0.860421, WATT_HOUR => 1 }
  }.freeze

  def self.convert_energy(value, from_unit, to_unit)
    (value.to_f * CONVERSIONS[from_unit][to_unit]).round(6)
  end
end
