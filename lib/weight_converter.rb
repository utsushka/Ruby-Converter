# frozen_string_literal: true

module WeightConverter
  CONVERSIONS = {
    mg: { mg: 1, g: 0.001, kg: 0.000001, oz: 0.000035274, lb: 0.00000220462 },
    g: { mg: 1000, g: 1, kg: 0.001, oz: 0.035274, lb: 0.00220462 },
    kg: { mg: 1_000_000, g: 1000, kg: 1, oz: 35.274, lb: 2.20462 },
    oz: { mg: 28_349.5, g: 28.3495, kg: 0.0283495, oz: 1, lb: 0.0625 },
    lb: { mg: 453_592, g: 453.592, kg: 0.453592, oz: 16, lb: 1 }
  }.freeze

  def convert_weight(value, from_unit, to_unit)
    (value.to_f * CONVERSIONS[from_unit.to_sym][to_unit.to_sym]).round(8)
  end
end
