class ProductsData
  attr_accessor :products, :discounts, :bonus_card_sku

  def initialize(products, discounts, bonus_card_sku)
    @products = products
    @bonus_card_sku = bonus_card_sku
    @discounts = discounts
  end

  def find_product_by_sku(sku)
    products.find { |product| product.sku == sku }
  end

  def find_discount_by_sku(sku)
    discounts.find { |discount| discount.sku == sku }
  end
end
