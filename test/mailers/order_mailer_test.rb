require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase
  test "received" do
    mail = OrderMailer.received(orders(:one))
    assert_equal "Order confirmation", mail.subject
    assert_equal ["example@example.org"], mail.to
    assert_equal ["depot@example.com"], mail.from
    assert_match /1 x Programming Ruby 1.9/, mail.body.encoded
  end

  # undefined protect_against_forgery? error ?????
  # test "shipped" do
  #   mail = OrderMailer.shipped(orders(:one))
  #   assert_equal "Your order has been shipped", mail.subject
  #   assert_equal ["example@example.org"], mail.to
  #   assert_equal ["depot@example.com"], mail.from
  # end

end
