# Конвертер единиц измерения

Это библиотека для конвертации различных единиц измерения, включая длину, вес, объем и кухонные единицы.

## Установка

Установите гем, выполнив:

```bash
gem install random_data_converter
```

Или добавьте это в ваш `Gemfile`:

```ruby
gem 'random_data_converter'
```

## Использование

```ruby
require 'random_data_converter'

converter = Converter.new
```

# Примеры конвертации
```
puts converter.convert_length(10, 'in', 'cm')  # => 25.4
puts converter.convert_weight(2, 'lbs', 'kg')  # => 0.90718474
puts converter.convert_volume(1, 'cup', 'ml')  # => 236.5882365
puts converter.convert_kitchen_units(2, 'tsp', 'tbsp')  # => 0.6666666666666666
```
