# frozen_string_literal: true
class CheckOut
  attr_reader :total # only a getter for external use

  def initialize
    @total = 0 # internal state
  end

  def scan(item)
    a_count = item.count('A')

    set_total(a_count * 50)
  end

  private

  def set_total(value)
    @total = value # internal "setter", not visible outside
  end
end
