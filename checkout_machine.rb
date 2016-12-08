class CheckoutMachine
  attr_accessor :bonus_card_scanned, :products, :data_source
  
  def initialize(data_source)
    @data_source = data_source
    @bonus_card_scanned = false
    @products = []
  end

  def scan(sku)
    product = data_source.find_by_sku(sku)
    handle_bonus_card && return if product.is_a? BonusCard
    products << product
  end

  def total
    if bonus_card_scanned
      balance - discounts
    else
      balance
    end
  end

  private

  def balance
    products.map(&:price).inject(:+)
  end

  def discounts
    products.uniq.map do |product|
      discount = data_source.find_discount_by_sku(product.sku)
      next unless discount
      product_quantity = products.select { |p| p.sku == product.sku }.length
      discount.amount * (product_quantity / discount.quantity).floor
    end.compact.inject(:+)
  end
  
  def handle_bonus_card
    self.bonus_card_scanned = true
  end
end
