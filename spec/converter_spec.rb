require 'converter'

RSpec.describe Converter do
  let(:converter) { Converter.new }

  describe '#convert_length' do
    it 'converts length from inches to centimeters' do
      expect(converter.convert_length(10, 'in', 'cm')).to eq(25.4)
    end

    it 'converts length from centimeters to meters' do
      expect(converter.convert_length(100, 'cm', 'm')).to eq(1)
    end

    it 'converts length from meters to kilometers' do
      expect(converter.convert_length(1000, 'm', 'km')).to eq(1)
    end
  end

  describe '#convert_weight' do
    it 'converts weight from ounces to grams' do
      expect(converter.convert_weight(2, 'oz', 'g')).to eq(56.699)
    end

    it 'converts weight from grams to kilograms' do
      expect(converter.convert_weight(1000, 'g', 'kg')).to eq(1)
    end

    it 'converts weight from kilograms to pounds' do
      expect(converter.convert_weight(1, 'kg', 'lb')).to eq(2.20462)
    end
  end

  describe '#convert_volume' do
    it 'converts volume from cups to milliliters' do
      expect(converter.convert_volume(1, 'cup', 'ml')).to eq(236.588)
    end

    it 'converts volume from liters to gallons' do
      expect(converter.convert_volume(1, 'l', 'gal')).to eq(0.264172)
    end

    it 'converts volume from milliliters to ounces' do
      expect(converter.convert_volume(100, 'ml', 'fl oz')).to eq(3.3814)
    end
  end

  describe '#convert_kitchen_units' do
    it 'converts kitchen units from teaspoons to tablespoons' do
      expect(converter.convert_kitchen_units(2, 'tsp', 'tbsp')).to eq(0.666666)
    end

    it 'converts kitchen units from tablespoons to cups' do
      expect(converter.convert_kitchen_units(2, 'tbsp', 'cup')).to eq(0.125)
    end

    it 'converts kitchen units from cups to teaspoons' do
      expect(converter.convert_kitchen_units(1, 'cup', 'tsp')).to eq(48)
    end
  end

  describe '#convert_time' do
    it 'converts time from seconds to minutes' do
      expect(converter.convert_time(3600, 's', 'min')).to eq(60.00012)
    end

    it 'converts time from minutes to hours' do
      expect(converter.convert_time(120, 'min', 'hr')).to eq(2.000004)
    end

    it 'converts time from hours to days' do
      expect(converter.convert_time(48, 'hr', 'day')).to eq(2.000002)
    end
  end

  describe '#convert_speed' do
    it 'converts speed from kilometers per hour to meters per second' do
      expect(converter.convert_speed(100, 'km/h', 'm/s')).to eq(27.7778)
    end

    it 'converts speed from meters per second to miles per hour' do
      expect(converter.convert_speed(50, 'm/s', 'mph')).to eq(111.847)
    end

    it 'converts speed from miles per hour to kilometers per hour' do
      expect(converter.convert_speed(60, 'mph', 'km/h')).to eq(96.5604)
    end
  end

  describe '#convert_area' do
    it 'converts area from square meters to square kilometers' do
      expect(converter.convert_area(1_000_000, 'sq_m', 'sq_km')).to eq(1.0e-06)
    end
  end

  describe '#convert_volume_nonliquid' do
    it 'converts volume from cubic meters to liters' do
      expect(converter.convert_volume_nonliquid(1, 'cubic_m', 'liters')).to eq(1000)
    end

    it 'converts volume from cubic feet to cubic inches' do
      expect(converter.convert_volume_nonliquid(100, 'cubic_ft', 'cubic_in')).to eq(172_800)
    end
  end

  describe '#convert_force' do
    it 'converts force from newton to kilogram force' do
      expect(converter.convert_force(10, 'newton', 'kilogram_force')).to eq(1.01972)
    end

    it 'converts force from kilogram force to pound force' do
      expect(converter.convert_force(5, 'kilogram_force', 'pound_force')).to eq(11.0231)
    end

    it 'converts force from pound force to newton' do
      expect(converter.convert_force(10, 'pound_force', 'newton')).to eq(44.4822)
    end
  end

  describe '#convert_pressure' do
    it 'converts pressure from pascal to atmosphere' do
      expect(converter.convert_pressure(101_325, 'pascal', 'atmosphere')).to eq(1.0)
    end

    it 'converts pressure from atmosphere to mmHg' do
      expect(converter.convert_pressure(1, 'atmosphere', 'mmHg')).to eq(760)
    end

    it 'converts pressure from mmHg to pascal' do
      expect(converter.convert_pressure(760, 'mmHg', 'pascal')).to eq(101_324.72)
    end
  end

  describe '#convert_energy' do
    it 'converts energy from joule to kilocalorie' do
      expect(converter.convert_energy(1000, 'joule', 'kilocalorie')).to eq(0.239006)
    end

    it 'converts energy from kilocalorie to watt hour' do
      expect(converter.convert_energy(1, 'kilocalorie', 'watt_hour')).to eq(1.16222)
    end

    it 'converts energy from watt hour to joule' do
      expect(converter.convert_energy(3600, 'watt_hour', 'joule')).to eq(12_960_000.0)
    end
  end
end
