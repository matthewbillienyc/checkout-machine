class BonusCard
  attr_reader :sky

  def initialize(bonus_card)
    @sku = bonus_card[:sku]
  end
end
