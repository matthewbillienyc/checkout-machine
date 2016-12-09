class ProductsData
  attr_accessor :products, :discounts

  def initialize(products, discounts)
    @products = products.map do |product|
      Product.new(product)
    end
    @products << BonusCard.new(sku: 000)
    @discounts = discounts.map do |discount|
      Discount.new(discount)
    end
  end

  def find_by_sku(sku)
    products.find { |product| product.sku == sku }
  end

  def find_discount_by_sku(sku)
    discounts.find { |discount| discount.sku == sku }
  end
end
