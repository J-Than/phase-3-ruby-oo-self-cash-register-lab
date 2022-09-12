class CashRegister

  attr_accessor  :total, :prior_total
  attr_reader :discount
  attr_writer :z

  def initialize(discount = 0)
    @discount = discount
    @prior_total = 0
    @total = 0
  end

  def add_item(item_name, price, quantity = 1)
    self.prior_total = @total
    self.total += price * quantity
  end

end