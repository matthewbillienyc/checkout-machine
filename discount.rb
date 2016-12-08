class Discount
  attr_reader :amount, :quantity, :sku

  def initialize(discount)
    @amount = discount[:amount]
    @quantity = discount[:quantity]
    @sku = discount[:sku]
  end
end
