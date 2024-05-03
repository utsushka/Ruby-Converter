# frozen_string_literal: true
class Converter
  LENGTH_CONVERSIONS = {
    'mm' => { 'mm' => 1, 'cm' => 0.1, 'm' => 0.001, 'km' => 0.000001, 'in' => 0.0393701, 'ft' => 0.00328084,
              'yd' => 0.00109361, 'mi' => 0.000000621371 },
    'cm' => { 'mm' => 10, 'cm' => 1, 'm' => 0.01, 'km' => 0.00001, 'in' => 0.393701, 'ft' => 0.0328084,
              'yd' => 0.0109361, 'mi' => 0.00000621371 },
    'm' => { 'mm' => 1000, 'cm' => 100, 'm' => 1, 'km' => 0.001, 'in' => 39.3701, 'ft' => 3.28084, 'yd' => 1.09361,
             'mi' => 0.000621371 },
    'km' => { 'mm' => 1_000_000, 'cm' => 100_000, 'm' => 1000, 'km' => 1, 'in' => 39_370.1, 'ft' => 3280.84,
              'yd' => 1093.61, 'mi' => 0.621371 },
    'in' => { 'mm' => 25.4, 'cm' => 2.54, 'm' => 0.0254, 'km' => 0.0000254, 'in' => 1, 'ft' => 0.0833333,
              'yd' => 0.0277778, 'mi' => 0.0000157828 },
    'ft' => { 'mm' => 304.8, 'cm' => 30.48, 'm' => 0.3048, 'km' => 0.0003048, 'in' => 12, 'ft' => 1, 'yd' => 0.333333,
              'mi' => 0.000189394 },
    'yd' => { 'mm' => 914.4, 'cm' => 91.44, 'm' => 0.9144, 'km' => 0.0009144, 'in' => 36, 'ft' => 3, 'yd' => 1,
              'mi' => 0.000568182 },
    'mi' => { 'mm' => 1_609_344, 'cm' => 160_934.4, 'm' => 1609.344, 'km' => 1.60934, 'in' => 63_360, 'ft' => 5280,
              'yd' => 1760, 'mi' => 1 }
  }.freeze

  WEIGHT_CONVERSIONS = {
    'mg' => { 'mg' => 1, 'g' => 0.001, 'kg' => 0.000001, 'oz' => 0.000035274, 'lb' => 0.00000220462 },
    'g' => { 'mg' => 1000, 'g' => 1, 'kg' => 0.001, 'oz' => 0.035274, 'lb' => 0.00220462 },
    'kg' => { 'mg' => 1_000_000, 'g' => 1000, 'kg' => 1, 'oz' => 35.274, 'lb' => 2.20462 },
    'oz' => { 'mg' => 28_349.5, 'g' => 28.3495, 'kg' => 0.0283495, 'oz' => 1, 'lb' => 0.0625 },
    'lb' => { 'mg' => 453_592, 'g' => 453.592, 'kg' => 0.453592, 'oz' => 16, 'lb' => 1 }
  }.freeze

  VOLUME_CONVERSIONS = {
    'ml' => { 'ml' => 1, 'l' => 0.001, 'fl oz' => 0.033814, 'cup' => 0.00422675, 'pt' => 0.00211338,
              'qt' => 0.00105669, 'gal' => 0.000264172 },
    'l' => { 'ml' => 1000, 'l' => 1, 'fl oz' => 33.814, 'cup' => 4.22675, 'pt' => 2.11338, 'qt' => 1.05669,
             'gal' => 0.264172 },
    'fl oz' => { 'ml' => 29.5735, 'l' => 0.0295735, 'fl oz' => 1, 'cup' => 0.125, 'pt' => 0.0625, 'qt' => 0.03125,
                 'gal' => 0.0078125 },
    'cup' => { 'ml' => 236.588, 'l' => 0.236588, 'fl oz' => 8, 'cup' => 1, 'pt' => 0.5, 'qt' => 0.25, 'gal' => 0.0625 },
    'pt' => { 'ml' => 473.176, 'l' => 0.473176, 'fl oz' => 16, 'cup' => 2, 'pt' => 1, 'qt' => 0.5, 'gal' => 0.125 },
    'qt' => { 'ml' => 946.353, 'l' => 0.946353, 'fl oz' => 32, 'cup' => 4, 'pt' => 2, 'qt' => 1, 'gal' => 0.25 },
    'gal' => { 'ml' => 3785.41, 'l' => 3.78541, 'fl oz' => 128, 'cup' => 16, 'pt' => 8, 'qt' => 4, 'gal' => 1 }
  }.freeze

  KITCHEN_UNITS_CONVERSIONS = {
    'tsp' => { 'tsp' => 1, 'tbsp' => 0.333333, 'cup' => 0.0208333 },
    'tbsp' => { 'tsp' => 3, 'tbsp' => 1, 'cup' => 0.0625 },
    'cup' => { 'tsp' => 48, 'tbsp' => 16, 'cup' => 1 }
  }.freeze

  TEMPERATURE_CONVERSIONS = {
    'C' => { 'C' => 1, 'F' => 33.8, 'K' => 274.15 },
    'F' => { 'C' => -17.2222, 'F' => 1, 'K' => 255.928 },
    'K' => { 'C' => -272.15, 'F' => -457.87, 'K' => 1 }
  }.freeze

  TIME_CONVERSIONS = {
    's' => { 's' => 1, 'min' => 0.0166667, 'hr' => 0.000277778, 'day' => 0.0000115741 },
    'min' => { 's' => 60, 'min' => 1, 'hr' => 0.0166667, 'day' => 0.000694444 },
    'hr' => { 's' => 3600, 'min' => 60, 'hr' => 1, 'day' => 0.0416667 },
    'day' => { 's' => 86_400, 'min' => 1440, 'hr' => 24, 'day' => 1 }
  }.freeze

  SPEED_CONVERSIONS = {
    'km/h' => { 'km/h' => 1, 'm/s' => 0.277778, 'mph' => 0.621371 },
    'm/s' => { 'km/h' => 3.6, 'm/s' => 1, 'mph' => 2.23694 },
    'mph' => { 'km/h' => 1.60934, 'm/s' => 0.44704, 'mph' => 1 }
  }.freeze

  AREA_CONVERSIONS = {
    'sq_m' => { 'sq_m' => 1, 'sq_km' => 0.000001, 'ha' => 0.0001, 'sq_ft' => 10.7639 },
    'sq_km' => { 'sq_m' => 1_000_000, 'sq_km' => 1, 'ha' => 100, 'sq_mi' => 0.386102 },
    'sq_ft' => { 'sq_m' => 0.092903, 'ha' => 0.0000092903, 'sq_km' => 0.000000092903, 'sq_ft' => 1 }
  }.freeze

  def convert_length(value, from_unit, to_unit)
    (value.to_f * LENGTH_CONVERSIONS[from_unit][to_unit]).round(6)
  end

  def convert_weight(value, from_unit, to_unit)
    from_conversion = WEIGHT_CONVERSIONS[from_unit]
    to_conversion = WEIGHT_CONVERSIONS[to_unit]

    return 0 if from_conversion.nil? || to_conversion.nil?

    (value.to_f * from_conversion[to_unit]).round(8)
  end

  def convert_volume(value, from_unit, to_unit)
    from_conversion = VOLUME_CONVERSIONS[from_unit]
    to_conversion = VOLUME_CONVERSIONS[to_unit]

    return 0 if from_conversion.nil? || to_conversion.nil?

    (value.to_f * from_conversion[to_unit]).round(10)
  end

  def convert_kitchen_units(value, from_unit, to_unit)
    from_conversion = KITCHEN_UNITS_CONVERSIONS[from_unit]
    to_conversion = KITCHEN_UNITS_CONVERSIONS[to_unit]

    return 0 if from_conversion.nil? || to_conversion.nil?

    (value.to_f * from_conversion[to_unit]).round(15)
  end

  def convert_temperature(value, from_unit, to_unit)
    from_conversion = TEMPERATURE_CONVERSIONS[from_unit]
    to_conversion = TEMPERATURE_CONVERSIONS[to_unit]

    return 0 if from_conversion.nil? || to_conversion.nil?

    (value.to_f * from_conversion[to_unit]).round(6)
  end

  def convert_time(value, from_unit, to_unit)
    from_conversion = TIME_CONVERSIONS[from_unit]
    to_conversion = TIME_CONVERSIONS[to_unit]

    return 0 if from_conversion.nil? || to_conversion.nil?

    (value.to_f * from_conversion[to_unit]).round(6)
  end

  def convert_speed(value, from_unit, to_unit)
    from_conversion = SPEED_CONVERSIONS[from_unit]
    to_conversion = SPEED_CONVERSIONS[to_unit]

    return 0 if from_conversion.nil? || to_conversion.nil?

    (value.to_f * from_conversion[to_unit]).round(6)
  end

  def convert_area(value, from_unit, to_unit)
    from_conversion = AREA_CONVERSIONS[from_unit]
    to_conversion = AREA_CONVERSIONS[to_unit]

    return 0 if from_conversion.nil? || to_conversion.nil?

    (value.to_f * from_conversion[to_unit]).round(6)
  end
end
