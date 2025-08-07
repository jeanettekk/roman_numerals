def numeral_method(numeral, numeral_number, roman_to_numeral_map)
  if numeral.start_with?('I')
    numeral_number - 1
  elsif numeral.include?('IV')
    numeral_number + roman_to_numeral_map[:V] - 1
  elsif numeral.include?('XV')
    numeral_number + 5 + numeral.scan('I').length
  elsif numeral.include?('IX')
    numeral_number + roman_to_numeral_map[:X] - 1
  else
    numeral_count = numeral.scan('I').length
    numeral_count + numeral_number
  end
end

def roman_to_numeral(numeral)
  roman_to_numeral_map = {
    V: 5,
    X: 10
  }
  if numeral.include?('X')
    numeral_method(numeral, 10, roman_to_numeral_map)
  elsif numeral.include?('V')
    numeral_method(numeral, 5, roman_to_numeral_map)
  else
    numeral.length
  end
end
