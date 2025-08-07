def numeral_method(numeral, numeral_number)
  if numeral.start_with?('I')
    numeral_number - 1
  elsif numeral.include?('IV')
    numeral_number + 4
  elsif numeral.include?('XVI')
    numeral_number + 6
  else
    numeral_count = numeral.scan('I').length
    numeral_count + numeral_number
  end
end

def roman_to_numeral(numeral)
  if numeral.include?('X')
    numeral_method(numeral, 10)
  elsif numeral.include?('V')
    numeral_method(numeral, 5)
  else
    numeral.length
  end
end
