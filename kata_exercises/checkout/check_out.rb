# frozen_string_literal: true
class CheckOut
  class << self
    attr_accessor :total

    def scan(item)
      # Config
      a_price = 50
      a_discount_amount = 20
      a_discount_quantity = 3

      b_price = 30
      b_discount_amount = 15
      b_discount_quantity = 2

      # Calculation
      a_count = item.count('A')
      b_count = item.count('B')

      number_of_discounts = (a_count / a_discount_quantity).floor
      number_of_discounts_b = (b_count / b_discount_quantity).floor
      discount = number_of_discounts * a_discount_amount
      discount_b = number_of_discounts_b * b_discount_amount
      total_without_discount_a = a_count * a_price
      total_without_discount_b = b_count * b_price

      @total = (total_without_discount_a + total_without_discount_b) - (discount + discount_b)
    end

    def reset
      @total = 0
    end
  end
end
