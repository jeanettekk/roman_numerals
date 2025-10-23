class CheckOut
  attr_reader :total # only a getter for external use

  def initialize
    @total = 0 # internal state
  end

  def scan(item)
    if item == "AAA"
      set_total(150)
    elsif item == "A"
      set_total(50)
    elsif item == "AA"
      set_total(100)
    end
  end

  private

  def set_total(value)
    @total = value # internal "setter", not visible outside
  end
end
