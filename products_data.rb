class ProductsData
  attr_accessor :products, :discounts, :bonus_card_sku

  def initialize(products_data)
    @products = products_data.fetch(:products, [])
    @bonus_card_sku = products_data.fetch(:bonus_card_sku, nil)
    @discounts = products_data.fetch(:discounts, [])
  end

  def find_product_by_sku(sku)
    products.find { |product| product.sku == sku }
  end

  def find_discount_by_sku(sku)
    discounts.find { |discount| discount.sku == sku }
  end
end
