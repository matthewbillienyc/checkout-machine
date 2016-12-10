class Discount
  attr_reader :sku, :terms

  def initialize(discount)
    @sku = discount.fetch(:sku, 999)
    @terms = discount.fetch(:terms, lambda { |q| q })
  end
end
