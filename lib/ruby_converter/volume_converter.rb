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
    ML => { ML => 1, L => 0.001, FL_OZ => 0.033814, CUP => 0.00422675, PT => 0.00211338, QT => 0.00105669,
            GAL => 0.000264172 },
    L => { ML => 1000, L => 1, FL_OZ => 33.814, CUP => 4.22675, PT => 2.11338, QT => 1.05669, GAL => 0.264172 },
    FL_OZ => { ML => 29.5735, L => 0.0295735, FL_OZ => 1, CUP => 0.125, PT => 0.0625, QT => 0.03125, GAL => 0.0078125 },
    CUP => { ML => 236.588, L => 0.236588, FL_OZ => 8, CUP => 1, PT => 0.5, QT => 0.25, GAL => 0.0625 },
    PT => { ML => 473.176, L => 0.473176, FL_OZ => 16, CUP => 2, PT => 1, QT => 0.5, GAL => 0.125 },
    QT => { ML => 946.353, L => 0.946353, FL_OZ => 32, CUP => 4, PT => 2, QT => 1, GAL => 0.25 },
    GAL => { ML => 3785.41, L => 3.78541, FL_OZ => 128, CUP => 16, PT => 8, QT => 4, GAL => 1 }
  }.freeze

  def convert_volume(value, from_unit, to_unit)
    (value.to_f * CONVERSIONS[from_unit][to_unit]).round(10)
  end
end