require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = users(:one)
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = "     "
    assert @user.invalid?
  end

  test "name should be unique" do
    @user.name = "name2"
    @user.save
    assert @user.invalid?
  end
end
