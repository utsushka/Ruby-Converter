# frozen_string_literal: true
require_relative 'converter'

module TimeConverter
  S = :s
  MIN = :min
  HR = :hr
  DAY = :day

  CONVERSIONS = {
    S => { S => 1, MIN => 0.0166667, HR => 0.000277778, DAY => 0.0000115741 },
    MIN => { S => 60, MIN => 1, HR => 0.0166667, DAY => 0.000694444 },
    HR => { S => 3600, MIN => 60, HR => 1, DAY => 0.0416667 },
    DAY => { S => 86_400, MIN => 1440, HR => 24, DAY => 1 }
  }.freeze

  def convert_time(value, from_unit, to_unit)
    Converter.convert(value, from_unit, to_unit, CONVERSIONS)
  end
end
