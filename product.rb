class Product
  attr_reader :name, :sku
  
  def initialize(product)
    @price = product[:price]
    @name = product[:name]
    @sku = product[:sku]
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
end
