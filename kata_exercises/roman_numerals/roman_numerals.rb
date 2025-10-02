# frozen_string_literal: true

def special_numerals_method(numeral, numeral_numbers_array)
  numeral_I_count = numeral.scan('I').length

  if numeral[-1] == 'I'
    numeral_numbers_array.sum + numeral_I_count
  else
    numeral_numbers_array.sum - numeral_I_count
  end
end

def special_chars?(numeral)
  roman_special_chars = { 'V' => 5, 'X' => 10 }
  special_chars_numbers = []

  numeral.each_char do |char|
    special_chars_numbers.push(roman_special_chars[char]) if roman_special_chars.include?(char)
  end

  return false if special_chars_numbers.empty?

  special_chars_numbers
end

def roman_to_numeral(numeral)

  special_chars_array = special_chars?(numeral)

  if special_chars_array
    if numeral.length == 1
      special_chars_array[0]
    else
      special_numerals_method(numeral, special_chars_array)
    end
  else
    numeral.length
  end
end
