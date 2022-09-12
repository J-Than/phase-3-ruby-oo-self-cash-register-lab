class CashRegister

  attr_accessor  :total, :items, :last_transaction
  attr_reader :discount

  def initialize(discount = 0)
    @discount = discount
    @last_transaction = []
    @items = []
    @total = 0
  end

  def add_item(item_name, price, quantity = 1)
    self.total += price * quantity
    quantity.times { self.items.push(item_name) }
    self.last_transaction = [item_name, price, quantity]
  end

  def apply_discount
    if @discount > 0 && @discount <= 100 then
      self.total = @total * ( 1.00 - @discount / 100.00 )
      return "After the discount, the total comes to $#{self.total.to_i}."
    else
      return "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.total -= @last_transaction[1] * @last_transaction[2]
    @last_transaction[2].times { self.items.pop }
    self.last_transaction = []
  end

end