# frozen_string_literal: true
class CheckOut
  attr_reader :total # only a getter for external use

  def initialize
    @total = 0 # internal state
  end

  def scan(item)
    case item
    when 'AAA'
      set_total(150)
    when 'A'
      set_total(50)
    when 'AA'
      set_total(100)
    else
      set_total(0)
    end
  end

  private

  def set_total(value)
    @total = value # internal "setter", not visible outside
  end
end
