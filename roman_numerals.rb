def numeral_method(numeral, numeral_number)
  if numeral.start_with?('I')
    numeral_number - 1
  elsif numeral.include?('IV')
    numeral_number + 4
  else
    numeral_count = numeral.scan('I').length
    sum = numeral_count + numeral_number
    puts "Debug: I'm here: #{numeral}, numeral.count = #{numeral_count}, sum = #{sum}"
    sum
  end
end

def roman_to_numeral(numeral)
  if numeral.include?('V') && !numeral.start_with?('X')
    numeral_method(numeral, 5)
  elsif numeral.include?('X')
    numeral_method(numeral, 10)
  else
    numeral.length
  end
end
