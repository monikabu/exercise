class RomanNumeral
  ROMAN_NUMERALS = {
    1000 => 'M',
    900 => 'DM',
    500 => 'D',
    400 => 'CD',
    100 => 'C',
    90 => 'XC',
    50 => 'L',
    40 => 'XL',
    10 => 'X',
    9 => 'IX',
    5 => 'V',
    4 => 'IV',
    1 => 'I'
  }.freeze

  def self.roman_representation_of(number)
    valid_number?(number)

    roman_numeral = ""
    ROMAN_NUMERALS.keys.each do |value|
      ratio = number / value
      next if ratio == 0
      roman_numeral = roman_numeral.concat partial_roman_numeral(value, ratio)
      number = number - ratio * value
    end
    roman_numeral
  end

  def self.valid_number?(number)
    return if number.is_a?(Fixnum) && number > 0 && number < 10_000
    error_message = 'Argument must be a positive integer lower than 10 000'
    raise ArgumentError, error_message
  end

  def self.partial_roman_numeral(value, ratio)
    partial_representation = ROMAN_NUMERALS[value] * ratio
  end
end
