require 'test_helper'

class UserTest < ActionDispatch::IntegrationTest
  fixtures :all
  # test "the truth" do
  #   assert true
  # end
  test "user test" do
    #"doesn't work without a signed user"
    get "/users"
    assert_equal 302 ,status
  end
  
end
