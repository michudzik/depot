require "application_system_test_case"

class OrdersTest < ApplicationSystemTestCase
  include ActiveJob::TestHelper

  test "check routing number" do
    LineItem.delete_all
    Order.delete_all

    visit store_index_url
    first('.catalogue li').click_on 'Add to Cart'
    click_on 'Checkout'

    fill_in 'order_name', with: 'Dave Thomas'
    fill_in 'order_address', with: '123 Main Street'
    fill_in 'order_email', with: 'dave@example.com'

    assert_no_selector '#order_routing_number'
    select "Check", from: 'pay_type'
    assert_selector '#order_routing_number'

    fill_in 'Routing #', with: "123456"
    fill_in 'Account #', with: "987654"

    perform_enqueued_jobs do
      click_button "Place order"
    end

    orders = Order.all
    assert_equal 1, orders.size

    order = orders.first
    assert_equal order.name, "Dave Thomas"
    assert_equal order.address, "123 Main Street"
    assert_equal order.email, "dave@example.com"
    assert_equal order.pay_type, "Check"
    assert_equal order.line_items.size, 1

    mail = ActionMailer::Base.deliveries.last
    assert_equal ["dave@example.com"], mail.to
    assert_equal 'Sam Ruby <depot@example.com>', mail.from
    assert_equal 'Order confirmatio', mail.subject
    
  end
end
