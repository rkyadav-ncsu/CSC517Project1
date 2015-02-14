require 'test_helper'

class ProjectTest < ActionDispatch::IntegrationTest
  fixtures :all
  # test "the truth" do
  #   assert true
  # end
  test "project and browse story" do
    #cannot browse without logging oin
    get "/projects"
    assert_equal 302, status
    end
end
