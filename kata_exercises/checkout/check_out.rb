class CheckOut
  attr_reader :total # only a getter for external use

  def initialize
    @total = 0 # internal state
  end

  def scan(item)
    set_total(50) if item == "A"
  end

  private

  def set_total(value)
    @total = value # internal "setter", not visible outside
  end
end
