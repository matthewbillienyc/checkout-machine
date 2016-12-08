require 'minitest/autorun'
require_relative '../checkout_machine'
require_relative '../bonus_card'
require_relative '../discount'
require_relative '../products_data'
require_relative '../product'

class CheckoutMachineTest < Minitest::Test
  def setup
    data_source = ProductsData.new(TestDataHelper.products, TestDataHelper.discounts)
    @cm = CheckoutMachine.new(data_source)
  end

  def test_scan_chips_expects_total_200
    # Arrange

    # Act
    @cm.scan(123)

    # Assert
    assert_equal 200, @cm.total
  end

  def test_scan_salsa_expects_total_100
    # Arrange

    # Act
    @cm.scan(456)

    # Assert
    assert_equal 100, @cm.total
  end

  def test_scan_wine_expects_total_1000
    # Arrange

    # Act
    @cm.scan(789)

    # Assert
    assert_equal 1000, @cm.total
  end

  def test_scan_cigarettes_expects_total_550
    # Arrange

    # Act
    @cm.scan(111)

    # Assert
    assert_equal 550, @cm.total
  end

  def test_scan_all_products_expects_total_1850
    # Arrange

    # Act
    @cm.scan(123)
    @cm.scan(456)
    @cm.scan(789)
    @cm.scan(111)

     # Assert
    assert_equal 1850, @cm.total
  end

  def test_scan_chips_with_bonus_card_expect_200
    # Arrange
    @cm.scan(123) # chips

    # Act
    @cm.scan(000)


    # Assert
    assert_equal 200, @cm.total
  end

  def test_scan_salsa_with_bonus_card_expects_50
    # Arrange
    @cm.scan(456) # salsa

    # Act
    @cm.scan(000)

    # Assert
    assert_equal 50, @cm.total
  end

  def test_scan_three_chips_with_bonus_card_expects_400
    # Arrange

    # Act
    3.times { @cm.scan(123) }
    @cm.scan(000)

    # Assert
    assert_equal 400, @cm.total
  end

  def test_scan_four_chips_with_bonus_card_expects_600
    # Arrange

    # Act
    4.times { @cm.scan(123) }
    @cm.scan(000)

    # Assert
    assert_equal 600, @cm.total
  end

  def test_scan_seven_chips_with_bonus_card_expects_1000
    # Arrange

    # Act
    7.times { @cm.scan(123) }
    @cm.scan(000)

    # Assert
    assert_equal 1000, @cm.total
  end
end

class TestDataHelper
  def self.products
    [
      {
        name: 'Chips',
        price: 200,
        sku: 123
      },
      {
        name: 'Salsa',
        price: 100,
        sku: 456
      },
      {
        name: 'Wine',
        price: 1000,
        sku: 1000
      },
      {
        name: 'Cigarettes',
        price: 500,
        sku: 111
      }
    ]
  end

  def self.discounts
    [
      {
        price: 200,
        sku: 123,
        quantity: 3
      },
      {
        price: 50,
        sku: 456,
        quantity: 1
      }
    ]
  end
end
