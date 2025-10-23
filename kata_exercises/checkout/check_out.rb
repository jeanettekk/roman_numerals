# frozen_string_literal: true
class CheckOut
  attr_reader :total # only a getter for external use

  def initialize
    @total = 0 # internal state
  end

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

    set_total(total_without_discount - discount)
  end

  private

  def set_total(value)
    @total = value # internal "setter", not visible outside
  end
end
