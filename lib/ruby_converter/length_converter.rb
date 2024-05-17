# frozen_string_literal: true

require_relative 'converter'

module LengthConverter
  MM = :mm
  CM = :cm
  M = :m
  KM = :km
  IN = :in
  FT = :ft
  YD = :yd
  MI = :mi

  CONVERSIONS = {
    'mm_to_mm' => ->(value) { value * 1 },
    'mm_to_cm' => ->(value) { value * 0.1 },
    'mm_to_m' => ->(value) { value * 0.001 },
    'mm_to_km' => ->(value) { value * 0.000001 },
    'mm_to_in' => ->(value) { value * 0.0393701 },
    'mm_to_ft' => ->(value) { value * 0.00328084 },
    'mm_to_yd' => ->(value) { value * 0.00109361 },
    'mm_to_mi' => ->(value) { value * 0.000000621371 },

    'cm_to_mm' => ->(value) { value * 10 },
    'cm_to_cm' => ->(value) { value * 1 },
    'cm_to_m' => ->(value) { value * 0.01 },
    'cm_to_km' => ->(value) { value * 0.00001 },
    'cm_to_in' => ->(value) { value * 0.393701 },
    'cm_to_ft' => ->(value) { value * 0.0328084 },
    'cm_to_yd' => ->(value) { value * 0.0109361 },
    'cm_to_mi' => ->(value) { value * 0.00000621371 },

    'm_to_mm' => ->(value) { value * 1000 },
    'm_to_cm' => ->(value) { value * 100 },
    'm_to_m' => ->(value) { value * 1 },
    'm_to_km' => ->(value) { value * 0.001 },
    'm_to_in' => ->(value) { value * 39.3701 },
    'm_to_ft' => ->(value) { value * 3.28084 },
    'm_to_yd' => ->(value) { value * 1.09361 },
    'm_to_mi' => ->(value) { value * 0.000621371 },

    'km_to_mm' => ->(value) { value * 1_000_000 },
    'km_to_cm' => ->(value) { value * 100_000 },
    'km_to_m' => ->(value) { value * 1000 },
    'km_to_km' => ->(value) { value * 1 },
    'km_to_in' => ->(value) { value * 39_370.1 },
    'km_to_ft' => ->(value) { value * 3280.84 },
    'km_to_yd' => ->(value) { value * 1093.61 },
    'km_to_mi' => ->(value) { value * 0.621371 },

    'in_to_mm' => ->(value) { value * 25.4 },
    'in_to_cm' => ->(value) { value * 2.54 },
    'in_to_m' => ->(value) { value * 0.0254 },
    'in_to_km' => ->(value) { value * 0.0000254 },
    'in_to_in' => ->(value) { value * 1 },
    'in_to_ft' => ->(value) { value * 0.0833333 },
    'in_to_yd' => ->(value) { value * 0.0277778 },
    'in_to_mi' => ->(value) { value * 0.0000157828 },

    'ft_to_mm' => ->(value) { value * 304.8 },
    'ft_to_cm' => ->(value) { value * 30.48 },
    'ft_to_m' => ->(value) { value * 0.3048 },
    'ft_to_km' => ->(value) { value * 0.0003048 },
    'ft_to_in' => ->(value) { value * 12 },
    'ft_to_ft' => ->(value) { value * 1 },
    'ft_to_yd' => ->(value) { value * 0.333333 },
    'ft_to_mi' => ->(value) { value * 0.000189394 },

    'yd_to_mm' => ->(value) { value * 914.4 },
    'yd_to_cm' => ->(value) { value * 91.44 },
    'yd_to_m' => ->(value) { value * 0.9144 },
    'yd_to_km' => ->(value) { value * 0.0009144 },
    'yd_to_in' => ->(value) { value * 36 },
    'yd_to_ft' => ->(value) { value * 3 },
    'yd_to_yd' => ->(value) { value * 1 },
    'yd_to_mi' => ->(value) { value * 0.000568182 },

    'mi_to_mm' => ->(value) { value * 1_609_344 },
    'mi_to_cm' => ->(value) { value * 160_934.4 },
    'mi_to_m' => ->(value) { value * 1609.344 },
    'mi_to_km' => ->(value) { value * 1.60934 },
    'mi_to_in' => ->(value) { value * 63_360 },
    'mi_to_ft' => ->(value) { value * 5280 },
    'mi_to_yd' => ->(value) { value * 1760 },
    'mi_to_mi' => ->(value) { value * 1 }
  }.freeze

  def self.convert_length(value, from_unit, to_unit)
    Converter.convert(value, from_unit.to_s, to_unit.to_s, CONVERSIONS)
  end
end
