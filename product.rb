class Product
  attr_reader :name, :sku
  
  def initialize(price, name, sku)
    @price = price
    @name = name
    @sku = sku
  end

  def price
    if taxable?
      @price + 50
    else
      @price
    end
  end

  def taxable?
    [111].include? @sku
  end

  def method_missing(method)
    return false
  end
end
