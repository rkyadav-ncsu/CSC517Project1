require 'test_helper'

class StoryTest < ActionDispatch::IntegrationTest
  fixtures :all
  # test "the truth" do
  #   assert true
  # end
  test "story browse" do
    #cannot browse without logging oin
    get "/stories"
    assert_equal 302, status
  end
end