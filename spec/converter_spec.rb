require 'converter'

RSpec.describe Converter do
  let(:converter) { Converter.new }

  describe '#convert_length' do
    it 'converts length from inches to centimeters' do
      expect(converter.convert_length(10, 'in', 'cm')).to eq(25.4)
    end
  end

  describe '#convert_weight' do
    it 'converts weight from ounces to grams' do
      expect(converter.convert_weight(2, 'oz', 'g')).to eq(56.699)
    end
  end

  describe '#convert_volume' do
    it 'converts volume from cups to milliliters' do
      expect(converter.convert_volume(1, 'cup', 'ml')).to eq(236.588)
    end
  end

  describe '#convert_kitchen_units' do
    it 'converts kitchen units from teaspoons to tablespoons' do
      expect(converter.convert_kitchen_units(2, 'tsp', 'tbsp')).to eq(0.666666)
    end
  end
end
