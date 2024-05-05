# frozen_string_literal: true

module VolumeConverter
  CONVERSIONS = {
    ml: { ml: 1, l: 0.001, fl_oz: 0.033814, cup: 0.00422675, pt: 0.00211338, qt: 0.00105669, gal: 0.000264172 },
    l: { ml: 1000, l: 1, fl_oz: 33.814, cup: 4.22675, pt: 2.11338, qt: 1.05669, gal: 0.264172 },
    fl_oz: { ml: 29.5735, l: 0.0295735, fl_oz: 1, cup: 0.125, pt: 0.0625, qt: 0.03125, gal: 0.0078125 },
    cup: { ml: 236.588, l: 0.236588, fl_oz: 8, cup: 1, pt: 0.5, qt: 0.25, gal: 0.0625 },
    pt: { ml: 473.176, l: 0.473176, fl_oz: 16, cup: 2, pt: 1, qt: 0.5, gal: 0.125 },
    qt: { ml: 946.353, l: 0.946353, fl_oz: 32, cup: 4, pt: 2, qt: 1, gal: 0.25 },
    gal: { ml: 3785.41, l: 3.78541, fl_oz: 128, cup: 16, pt: 8, qt: 4, gal: 1 }
  }.freeze

  def convert_volume(value, from_unit, to_unit)
    (value.to_f * CONVERSIONS[from_unit.to_sym][to_unit.to_sym]).round(10)
  end
end
