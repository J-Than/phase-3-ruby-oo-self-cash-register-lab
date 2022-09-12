class CashRegister

  attr_accessor :x
  attr_reader :discount, :total
  attr_writer :z

  def initialize(discount = 0)
    @discount = discount
    @total = 0
  end

end