require_relative 'roman_numerals'

def assert_that(actual, expected)
  return unless actual != expected

  raise "Assertion failed: expected #{expected.inspect}, but got #{actual.inspect}"
end

# Parameterized test
numbers = [
  ['I', 1],
  ['II', 2],
  ['III', 3],
  ['IV', 4],
  ['V', 5],
  ['VI', 6],
  ['VII', 7],
  ['VIII', 8],
  ['IX', 9],
  ['X', 10],
  ['XII', 12],
  ['XIV', 14]
]

# Parameterized test
numbers.each do |roman, num|
  assert_that(roman_to_numeral(roman), num)
  puts "✅ #{roman} = #{num}"
rescue StandardError => e
  puts "❌ #{roman} != #{num} : #{e.message}"
end

