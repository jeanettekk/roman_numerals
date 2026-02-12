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
      discount_a, total_without_discount_a = calculate_discounted_prices(a_discount_amount, a_discount_quantity, a_price, item, 'A')
      discount_b, total_without_discount_b = calculate_discounted_prices(b_discount_amount, b_discount_quantity, b_price, item, 'B')
      total_without_discount_c = calculate_prices_without_discount(c_price, item)


      total_amount_all = total_without_discount_a + total_without_discount_b + total_without_discount_c
      total_discount_all = discount_a + discount_b

      @total = total_amount_all - total_discount_all
    end

    def reset
      @total = 0
    end

    private

    def calculate_prices_without_discount(c_price, item)
      c_count = item.count('C')
      c_count * c_price
    end

    def calculate_discounted_prices(discount_amount, discount_quantity, price_per_item, item, letter)
      letter_count = item.count(letter)
      number_of_discounts = (letter_count / discount_quantity).floor
      discount = number_of_discounts * discount_amount
      total_without_discount = letter_count * price_per_item
      [discount, total_without_discount]
    end
  end
end
