# frozen_string_literal: true

module SpeedConverter
  KM_H = :km_h
  M_S = :m_s
  MPH = :mph

  CONVERSIONS = {
    'km_h_to_km_h' => ->(value) { value * 1 },
    'km_h_to_m_s' => ->(value) { value * 0.277778 },
    'km_h_to_mph' => ->(value) { value * 0.621371 },

    'm_s_to_km_h' => ->(value) { value * 3.6 },
    'm_s_to_m_s' => ->(value) { value * 1 },
    'm_s_to_mph' => ->(value) { value * 2.23694 },

    'mph_to_km_h' => ->(value) { value * 1.60934 },
    'mph_to_m_s' => ->(value) { value * 0.44704 },
    'mph_to_mph' => ->(value) { value * 1 }
  }.freeze

  def self.convert_speed(value, from_unit, to_unit)
    Converter.convert(value, from_unit.to_s, to_unit.to_s, CONVERSIONS)
  end
end
