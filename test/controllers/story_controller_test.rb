require 'test_helper'

class StoryControllerTest < ActionController::TestCase
  def setup
    @controller = StoriesController.new
  end

  test "should get index" do
    get :index
    assert_response :found
  end

end
