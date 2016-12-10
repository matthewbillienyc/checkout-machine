class Product
  attr_reader :name, :sku
  
  def initialize(product)
    @price = product.fetch(:price, 50)
    @name = product.fetch(:name, 'Miscellaneous')
    @sku = product.fetch(:sku, 999)
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
