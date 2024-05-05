# frozen_string_literal: true

module LengthConverter
  CONVERSIONS = {
    mm: { mm: 1, cm: 0.1, m: 0.001, km: 0.000001, in: 0.0393701, ft: 0.00328084, yd: 0.00109361, mi: 0.000000621371 },
    cm: { mm: 10, cm: 1, m: 0.01, km: 0.00001, in: 0.393701, ft: 0.0328084, yd: 0.0109361, mi: 0.00000621371 },
    m: { mm: 1000, cm: 100, m: 1, km: 0.001, in: 39.3701, ft: 3.28084, yd: 1.09361, mi: 0.000621371 },
    km: { mm: 1_000_000, cm: 100_000, m: 1000, km: 1, in: 39_370.1, ft: 3280.84, yd: 1093.61, mi: 0.621371 },
    in: { mm: 25.4, cm: 2.54, m: 0.0254, km: 0.0000254, in: 1, ft: 0.0833333, yd: 0.0277778, mi: 0.0000157828 },
    ft: { mm: 304.8, cm: 30.48, m: 0.3048, km: 0.0003048, in: 12, ft: 1, yd: 0.333333, mi: 0.000189394 },
    yd: { mm: 914.4, cm: 91.44, m: 0.9144, km: 0.0009144, in: 36, ft: 3, yd: 1, mi: 0.000568182 },
    mi: { mm: 1_609_344, cm: 160_934.4, m: 1609.344, km: 1.60934, in: 63_360, ft: 5280, yd: 1760, mi: 1 }
  }.freeze

  def convert_length(value, from_unit, to_unit)
    (value.to_f * CONVERSIONS[from_unit.to_sym][to_unit.to_sym]).round(6)
  end
end
