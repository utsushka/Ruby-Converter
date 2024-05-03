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
end
