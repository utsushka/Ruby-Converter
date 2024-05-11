# frozen_string_literal: true
require_relative 'converter'

module SpeedConverter
  KM_H = :km_h
  M_S = :m_s
  MPH = :mph

  CONVERSIONS = {
    KM_H => { KM_H => 1, M_S => 0.277778, MPH => 0.621371 },
    M_S => { KM_H => 3.6, M_S => 1, MPH => 2.23694 },
    MPH => { KM_H => 1.60934, M_S => 0.44704, MPH => 1 }
  }.freeze

  def convert_speed(value, from_unit, to_unit)
    Converter.convert(value, from_unit, to_unit, CONVERSIONS)
  end
end
