require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  
  def setup
    @order = orders(:one)
  end

  test "should be valid" do
    assert @order.valid?
  end

  test "name should be present" do
    @order.name = nil
    assert @order.invalid?
  end

  test "email should be present" do
    @order.email = nil
    assert @order.invalid?
  end

  test "address should be present" do
    @order.address = nil
    assert @order.invalid?
  end

  test "pay type should be known" do
    @order.pay_type = nil
    assert @order.invalid?
  end
  
end
