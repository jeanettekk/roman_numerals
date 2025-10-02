class CheckOut
  attr_reader :total # only a getter for external use

  def initialize
    @total = 0 # internal state
  end

  def scan(item)
    # takes a string argument
    # later you can update @total here
  end

  private

  def set_total(value)
    @total = value # internal "setter", not visible outside
  end
end
