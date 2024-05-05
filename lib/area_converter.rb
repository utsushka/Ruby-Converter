module AreaConverter
  SQ_M = :sq_m
  SQ_KM = :sq_km
  HA = :ha
  SQ_FT = :sq_ft

  CONVERSIONS = {
    SQ_M => { SQ_M => 1, SQ_KM => 0.000001, HA => 0.0001, SQ_FT => 10.7639 },
    SQ_KM => { SQ_M => 1_000_000, SQ_KM => 1, HA => 100, SQ_FT => 0.000000092903 },
    SQ_FT => { SQ_M => 0.092903, HA => 0.0000092903, SQ_KM => 0.000000092903, SQ_FT => 1 }
  }.freeze

  def self.convert_area(value, from_unit, to_unit)
    value.to_f * CONVERSIONS[from_unit][to_unit] / CONVERSIONS[to_unit][from_unit]
  end
end