# frozen_string_literal: true

module WeightConverter
  MG = :mg
  G = :g
  KG = :kg
  OZ = :oz
  LB = :lb

  CONVERSIONS = {
    MG => { MG => 1, G => 0.001, KG => 0.000001, OZ => 0.000035274, LB => 0.00000220462 },
    G => { MG => 1000, G => 1, KG => 0.001, OZ => 0.035274, LB => 0.00220462 },
    KG => { MG => 1_000_000, G => 1000, KG => 1, OZ => 35.274, LB => 2.20462 },
    OZ => { MG => 28_349.5, G => 28.3495, KG => 0.0283495, OZ => 1, LB => 0.0625 },
    LB => { MG => 453_592, G => 453.592, KG => 0.453592, OZ => 16, LB => 1 }
  }.freeze

  def convert_weight(value, from_unit, to_unit)
    (value.to_f * CONVERSIONS[from_unit][to_unit]).round(8)
  end
end
