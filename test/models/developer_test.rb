require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Test name", email: "email@test.com",
    password: "test", password_confirmation: "test")
  end

  test "Name should be present" do
    @user.name = ""
    assert_not @user.valid?
  end

  test "Email should be present" do
    @user.email = ""
    assert_not @user.valid?
  end
end