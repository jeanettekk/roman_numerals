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

      c_price = 20

      # Calculation
      a_count = item.count('A')
      b_count = item.count('B')
      c_count = item.count('C')

      number_of_discounts_a = (a_count / a_discount_quantity).floor
      number_of_discounts_b = (b_count / b_discount_quantity).floor
      discount_a = number_of_discounts_a * a_discount_amount
      discount_b = number_of_discounts_b * b_discount_amount
      discount_c = 0
      total_without_discount_a = a_count * a_price
      total_without_discount_b = b_count * b_price
      total_without_discount_c = c_count * c_price

      total_amount_all = total_without_discount_a + total_without_discount_b + total_without_discount_c
      total_discount_all = discount_a + discount_b + discount_c

      @total = total_amount_all - total_discount_all
    end

    def reset
      @total = 0
    end
  end
end
