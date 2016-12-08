class CheckoutMachine
  attr_accessor :bonus_card_scanned, :products, :data_source
  
  def initialize(data_source)
    @data_source = data_source
    @bonus_card_scanned = false
    @products = []
  end

  def scan(sku)
    product = data_source.find_by_sku(sku)
    return handle_bonus_card if product.is_a? BonusCard
    products << product
    current_balance
  end

  def current_balance
    if bonus_card_scanned
      discounted_balance
    else
      balance
    end
  end

  private

  def balance
    products.map(&:price).inject(:+)
  end

  def discounted_balance
    products.uniq.map do |product|
      discount = data_source.find_discount_by_sku(product.sku)
      product_quantity = products.select { |p| p.sku == product.sku }.length
      discount.price * (product_quanity / discount.quantity).floor
    end.inject(:+)
  end
  
  def handle_bonus_card
    bonus_card_scanned = true
  end
end
