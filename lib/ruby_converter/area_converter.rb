# frozen_string_literal: true

require_relative 'converter'

module AreaConverter
  SQ_M = :sq_m
  SQ_KM = :sq_km
  HA = :ha
  SQ_FT = :sq_ft

  CONVERSIONS = {
    'sq_m_to_sq_m' => ->(value) { value * 1 },
    'sq_m_to_sq_km' => ->(value) { value * 0.000001 },
    'sq_m_to_ha' => ->(value) { value * 0.0001 },
    'sq_m_to_sq_ft' => ->(value) { value * 10.7639 },

    'sq_km_to_sq_m' => ->(value) { value * 1_000_000 },
    'sq_km_to_sq_km' => ->(value) { value * 1 },
    'sq_km_to_ha' => ->(value) { value * 100 },
    'sq_km_to_sq_ft' => ->(value) { value * 10_763_910 },

    'sq_ft_to_sq_m' => ->(value) { value * 0.092903 },
    'sq_ft_to_ha' => ->(value) { value * 0.0000092903 },
    'sq_ft_to_sq_km' => ->(value) { value * 0.000000092903 },
    'sq_ft_to_sq_ft' => ->(value) { value * 1 }
  }.freeze

  def self.convert_area(value, from_unit, to_unit, round = 2)
    Converter.convert(value, from_unit.to_s, to_unit.to_s, CONVERSIONS, round)
  end
end