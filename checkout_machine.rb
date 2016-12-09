class CheckoutMachine
  attr_accessor :bonus_card_scanned, :products, :data_source
  
  def initialize(data_source)
    @data_source = data_source
    @bonus_card_scanned = false
    @products = []
  end

  def scan(sku)
    product = data_source.find_product_by_sku(sku)
    handle_bonus_card && return if product.is_a? BonusCard
    products << product
  end

  def total
    if bonus_card_scanned
      balance - total_discounts
    else
      balance
    end
  end

  private

  def balance
    products.map(&:price).inject(:+)
  end

  def total_discounts
    available_discounts.map { |d| d.terms.call(product_quantity(d.sku)) }.inject(:+)
  end

  def available_discounts
    data_source.discounts.select { |d| products.map(&:sku).include? d.sku }
  end

  def product_quantity(sku)
    products.select { |p| p.sku == sku }.length
  end

  def handle_bonus_card
    self.bonus_card_scanned = true
  end
end
