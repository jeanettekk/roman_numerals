def numeral_method(numeral, numeral_number)
  if numeral.start_with?('I')
    numeral_number - 1
  else
    numeral.count('I123') + numeral_number
  end
end

def roman_to_numeral(numeral)
  if numeral.include?('V')
    numeral_method(numeral, 5)
  elsif numeral.include?('X')
    numeral_method(numeral, 10)
  else
    numeral.length
  end
end
