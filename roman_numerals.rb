def numeral_method(numeral, numeral_number, roman_special_chars)
  if numeral.start_with?('I')
    numeral_number - 1
  elsif numeral.include?('IV')
    numeral_number + roman_special_chars[:V] - 1
  elsif numeral.include?('XV')
    numeral_number + 5 + numeral.scan('I').length
  elsif numeral.include?('IX')
    numeral_number + roman_special_chars[:X] - 1
  else
    numeral_count = numeral.scan('I').length
    numeral_count + numeral_number
  end
end

def has_special_chars(numeral, roman_special_chars)
  numeral_array = numeral.split
  numeral_array.each do |char|
    char if roman_special_chars.include?(char)
  end
end

def roman_to_numeral(numeral)
  roman_special_chars = {
    V: 5,
    X: 10
  }
  if has_special_chars(numeral, roman_special_chars)
    numeral_method(numeral, 10, roman_special_chars)
  elsif numeral.include?(roman_special_chars)
    numeral_method(numeral, 5, roman_special_chars)
  else
    numeral.length
  end
end
