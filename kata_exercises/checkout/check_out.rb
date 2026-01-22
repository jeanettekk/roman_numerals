# frozen_string_literal: true
class CheckOut
  class << self
    attr_accessor :total

    def scan(item)
      # Config
      a_price = 50
      a_discount_amount = 20
      a_discount_quantity = 3
      # Calculation
      a_count = item.count('A')
      number_of_discounts = (a_count / a_discount_quantity).floor
      discount = number_of_discounts * a_discount_amount
      total_without_discount = a_count * a_price

      @total = total_without_discount - discount
    end

    def reset
      @total = 0
    end
  end
end
