class Discount
  attr_reader :price, :quantity, :sku

  def initialize(discount)
    @price = discount[:price]
    @quantity = discount[:quantity]
    @sku = discount[:sku]
  end
end
