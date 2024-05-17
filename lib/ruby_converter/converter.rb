class Converter

  def self.convert(value, from, to, conversions, round = 2)
    conversion_key = "#{from}_to_#{to}"
    conversion_proc = conversions[conversion_key]

    if conversion_proc
      result = conversion_proc.call(value)
      result.round(round)
    else
      nil  # Могли заменить на `raise ArgumentError, "Unsupported conversion from #{from} to #{to}"` для выброса исключения, но решили сделать через nil
    end
  end
end