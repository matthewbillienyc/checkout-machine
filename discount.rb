class Discount
  attr_reader :sku, :terms

  def initialize(sku, terms)
    @sku = sku
    self.class.send(:define_method, "apply_#{@sku}_discount", terms)
  end
end
