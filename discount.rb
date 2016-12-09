class Discount
  attr_reader :sku, :terms

  def initialize(discount)
    @sku = discount[:sku]
    @terms = discount[:terms]
  end
end
