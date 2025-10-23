# frozen_string_literal: true
class CheckOut
  attr_reader :total # only a getter for external use

  def initialize
    @total = 0 # internal state
  end

  def scan(item)
    a_count = item.count('A')
    number_of_discounts = (a_count / 3).floor
    discount = number_of_discounts * 20
    total_without_discount = a_count * 50

    set_total(total_without_discount - discount)
  end

  private

  def set_total(value)
    @total = value # internal "setter", not visible outside
  end
end
