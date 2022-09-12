require 'pry'

class CashRegister

  attr_accessor  :total, :prior_total, :pre_discount_total, :items
  attr_reader :discount
  attr_writer :z

  def initialize(discount = 0)
    @discount = discount
    @pre_discount_total = 0
    @prior_total = 0
    @total = 0
    @items = []
  end

  def add_item(item_name, price, quantity = 1)
    self.prior_total = @pre_discount_total
    self.pre_discount_total += price * quantity
    self.total = @pre_discount_total
    self.items.push(item_name)
  end

  def apply_discount
    if @discount > 0 && @discount <= 100 then
      self.total = @pre_discount_total * ( 1.0 - @discount / 100.0 )
      return "After the discount, the total comes to $#{self.total.to_i}."
    else
      return "There is no discount to apply."
    end
  end

end

# cash_register_with_discount = CashRegister.new(20)
# cash_register_with_discount.add_item("expensive", 1000)
# cash_register_with_discount.apply_discount