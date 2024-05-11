# frozen_string_literal: true

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
    MM => { MM => 1, CM => 0.1, M => 0.001, KM => 0.000001, IN => 0.0393701, FT => 0.00328084, YD => 0.00109361,
            MI => 0.000000621371 },
    CM => { MM => 10, CM => 1, M => 0.01, KM => 0.00001, IN => 0.393701, FT => 0.0328084, YD => 0.0109361,
            MI => 0.00000621371 },
    M => { MM => 1000, CM => 100, M => 1, KM => 0.001, IN => 39.3701, FT => 3.28084, YD => 1.09361, MI => 0.000621371 },
    KM => { MM => 1_000_000, CM => 100_000, M => 1000, KM => 1, IN => 39_370.1, FT => 3280.84, YD => 1093.61,
            MI => 0.621371 },
    IN => { MM => 25.4, CM => 2.54, M => 0.0254, KM => 0.0000254, IN => 1, FT => 0.0833333, YD => 0.0277778,
            MI => 0.0000157828 },
    FT => { MM => 304.8, CM => 30.48, M => 0.3048, KM => 0.0003048, IN => 12, FT => 1, YD => 0.333333,
            MI => 0.000189394 },
    YD => { MM => 914.4, CM => 91.44, M => 0.9144, KM => 0.0009144, IN => 36, FT => 3, YD => 1, MI => 0.000568182 },
    MI => { MM => 1_609_344, CM => 160_934.4, M => 1609.344, KM => 1.60934, IN => 63_360, FT => 5280, YD => 1760,
            MI => 1 }
  }.freeze

  def convert_length(value, from_unit, to_unit)
    (value.to_f * CONVERSIONS[from_unit][to_unit]).round(6)
  end
end