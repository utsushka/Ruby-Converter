# frozen_string_literal: true

class Converter
  def self.convert(value, from, to, conversions, round = 2)
    conversion_key = "#{from}_to_#{to}"
    conversion_proc = conversions[conversion_key]

    if conversion_proc
      result = conversion_proc.call(value)
      result.round(round)
    else
      nil # Решили сделать через nil
    end
  end
end