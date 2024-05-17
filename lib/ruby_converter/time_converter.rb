# frozen_string_literal: true

module TimeConverter
  S = :s
  MIN = :min
  HR = :hr
  DAY = :day

  CONVERSIONS = {
    's_to_s' => ->(value) { value * 1 },
    's_to_min' => ->(value) { value * 0.0166667 },
    's_to_hr' => ->(value) { value * 0.000277778 },
    's_to_day' => ->(value) { value * 0.0000115741 },

    'min_to_s' => ->(value) { value * 60 },
    'min_to_min' => ->(value) { value * 1 },
    'min_to_hr' => ->(value) { value * 0.0166667 },
    'min_to_day' => ->(value) { value * 0.000694444 },

    'hr_to_s' => ->(value) { value * 3600 },
    'hr_to_min' => ->(value) { value * 60 },
    'hr_to_hr' => ->(value) { value * 1 },
    'hr_to_day' => ->(value) { value * 0.0416667 },

    'day_to_s' => ->(value) { value * 86_400 },
    'day_to_min' => ->(value) { value * 1440 },
    'day_to_hr' => ->(value) { value * 24 },
    'day_to_day' => ->(value) { value * 1 }
  }.freeze

  def self.convert_time(value, from_unit, to_unit)
    Converter.convert(value, from_unit.to_s, to_unit.to_s, CONVERSIONS)
  end
end
