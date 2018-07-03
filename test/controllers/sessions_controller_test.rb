require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
  end
  test "should get new" do
    get login_url
    assert_response :success
  end

  test "should login" do
    post login_url, params: { name: @user.name, password: 'secret'}
    assert_redirected_to admin_url
    assert_equal @user.id, session[:user_id]
  end

  test "should fail login" do
    post login_url, params: { name: @user.name, password: "" }
    assert_redirected_to login_url
  end

  test "should get destroy" do
    delete logout_url
    assert_redirected_to store_index_url
  end

end
