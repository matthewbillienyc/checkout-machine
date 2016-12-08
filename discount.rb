class Discount
  attr_reader :price, :quantity, :sku

  def initialize(discount)
    @price = product[:price]
    @quantity = product[:quantity]
    @sku = product[:sku]
  end
end
