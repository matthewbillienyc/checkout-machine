module InterfaceLayer
  class ProductWrapper
    def self.product(product)
      Product.new(product[:price], product[:name], product[:sku])
    end
  end

  class DiscountWrapper
    def self.discount(discount)
      Discount.new(discount[:sku], discount[:terms])
    end
  end
end
