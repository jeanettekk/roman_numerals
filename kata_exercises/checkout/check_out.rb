# frozen_string_literal: true
class CheckOut
  attr_reader :total # only a getter for external use

  def initialize
    @total = 0 # internal state
  end

  def scan(item)
    a_count = item.count('A')

    if a_count > 4
      set_total(230)
    elsif a_count > 3
      set_total(180)
    elsif a_count == 3
      set_total(130)
    else
      set_total(a_count * 50)
    end
  end

  private

  def set_total(value)
    @total = value # internal "setter", not visible outside
  end
end
