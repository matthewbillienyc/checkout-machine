class ProductsData
  attr_accessor :products, :discounts

  def initialize(products, discounts)
    @products = products
    @products << BonusCard.new(sku: 000)
    @discounts = discounts
  end

  def find_product_by_sku(sku)
    products.find { |product| product.sku == sku }
  end

  def find_discount_by_sku(sku)
    discounts.find { |discount| discount.sku == sku }
  end
end
