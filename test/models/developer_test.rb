require 'test_helper'

class DeveloperTest < ActiveSupport::TestCase
  def setup
    @developer = Developer.new(name: "Test name", email: "email@test.com",
    password: "test", password_confirmation: "test")
  end

  test "Name should be present" do
    @developer.name = ""
    assert_not @developer.valid?
  end

  test "Email should be present" do
    @developer.email = ""
    assert_not @developer.valid?
  end
end