module TemperatureConverter
  C = :C
  F = :F
  K = :K

  CONVERSIONS = {
    C => { C => 1, F => 33.8, K => 274.15 },
    F => { C => -17.2222, F => 1, K => 255.928 },
    K => { C => -272.15, F => -457.87, K => 1 }
  }.freeze

  def convert_temperature(value, from_unit, to_unit)
    (value.to_f * CONVERSIONS[from_unit][to_unit]).round(6)
  end
end
