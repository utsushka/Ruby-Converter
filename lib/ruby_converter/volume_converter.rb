# frozen_string_literal: true

module VolumeConverter
  ML = :ml
  L = :l
  FL_OZ = :fl_oz
  CUP = :cup
  PT = :pt
  QT = :qt
  GAL = :gal

  CONVERSIONS = {
    'ml_to_ml' => ->(value) { value * 1 },
    'ml_to_l' => ->(value) { value * 0.001 },
    'ml_to_fl_oz' => ->(value) { value * 0.033814 },
    'ml_to_cup' => ->(value) { value * 0.00422675 },
    'ml_to_pt' => ->(value) { value * 0.00211338 },
    'ml_to_qt' => ->(value) { value * 0.00105669 },
    'ml_to_gal' => ->(value) { value * 0.000264172 },

    'l_to_ml' => ->(value) { value * 1000 },
    'l_to_l' => ->(value) { value * 1 },
    'l_to_fl_oz' => ->(value) { value * 33.814 },
    'l_to_cup' => ->(value) { value * 4.22675 },
    'l_to_pt' => ->(value) { value * 2.11338 },
    'l_to_qt' => ->(value) { value * 1.05669 },
    'l_to_gal' => ->(value) { value * 0.264172 },

    'fl_oz_to_ml' => ->(value) { value * 29.5735 },
    'fl_oz_to_l' => ->(value) { value * 0.0295735 },
    'fl_oz_to_fl_oz' => ->(value) { value * 1 },
    'fl_oz_to_cup' => ->(value) { value * 0.125 },
    'fl_oz_to_pt' => ->(value) { value * 0.0625 },
    'fl_oz_to_qt' => ->(value) { value * 0.03125 },
    'fl_oz_to_gal' => ->(value) { value * 0.0078125 },

    'cup_to_ml' => ->(value) { value * 236.588 },
    'cup_to_l' => ->(value) { value * 0.236588 },
    'cup_to_fl_oz' => ->(value) { value * 8 },
    'cup_to_cup' => ->(value) { value * 1 },
    'cup_to_pt' => ->(value) { value * 0.5 },
    'cup_to_qt' => ->(value) { value * 0.25 },
    'cup_to_gal' => ->(value) { value * 0.0625 },

    'pt_to_ml' => ->(value) { value * 473.176 },
    'pt_to_l' => ->(value) { value * 0.473176 },
    'pt_to_fl_oz' => ->(value) { value * 16 },
    'pt_to_cup' => ->(value) { value * 2 },
    'pt_to_pt' => ->(value) { value * 1 },
    'pt_to_qt' => ->(value) { value * 0.5 },
    'pt_to_gal' => ->(value) { value * 0.125 },

    'qt_to_ml' => ->(value) { value * 946.353 },
    'qt_to_l' => ->(value) { value * 0.946353 },
    'qt_to_fl_oz' => ->(value) { value * 32 },
    'qt_to_cup' => ->(value) { value * 4 },
    'qt_to_pt' => ->(value) { value * 2 },
    'qt_to_qt' => ->(value) { value * 1 },
    'qt_to_gal' => ->(value) { value * 0.25 },

    'gal_to_ml' => ->(value) { value * 3785.41 },
    'gal_to_l' => ->(value) { value * 3.78541 },
    'gal_to_fl_oz' => ->(value) { value * 128 },
    'gal_to_cup' => ->(value) { value * 16 },
    'gal_to_pt' => ->(value) { value * 8 },
    'gal_to_qt' => ->(value) { value * 4 },
    'gal_to_gal' => ->(value) { value * 1 }
  }.freeze

  def self.convert_volume(value, from_unit, to_unit)
    Converter.convert(value, from_unit.to_s, to_unit.to_s, CONVERSIONS)
  end
end
