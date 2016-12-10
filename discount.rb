class Discount
  attr_reader :sku, :terms

  def initialize(discount)
    @sku = discount[:sku]
    self.class.send(:define_method, "apply_#{@sku}_discount", discount[:terms])
  end
end
