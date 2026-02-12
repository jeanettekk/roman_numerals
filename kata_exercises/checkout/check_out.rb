# frozen_string_literal: true
class CheckOut
  class << self
    attr_accessor :total

    def scan(item)
      # Calculation
      discount_a, total_without_discount_a = calculate_discounted_prices(discount_amount: 20,
                                                                         discount_quantity: 3,
                                                                         price_per_item: 50,
                                                                         item: item,
                                                                         letter: 'A')
      discount_b, total_without_discount_b = calculate_discounted_prices(discount_amount: 15,
                                                                         discount_quantity: 2,
                                                                         price_per_item: 30,
                                                                         item: item,
                                                                         letter: 'B')
      price_c = calculate_prices_without_discount(20, item)


      total_amount_all = total_without_discount_a + total_without_discount_b + price_c
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

    def calculate_discounted_prices(discount_amount:, discount_quantity:, price_per_item:, item:, letter:)
      letter_count = item.count(letter)
      number_of_discounts = (letter_count / discount_quantity).floor
      discount = number_of_discounts * discount_amount
      total_without_discount = letter_count * price_per_item
      [discount, total_without_discount]
    end
  end
end
