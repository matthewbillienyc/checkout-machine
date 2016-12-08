class BonusCard
  attr_reader :sku

  def initialize(bonus_card)
    @sku = bonus_card[:sku]
  end
end
