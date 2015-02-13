require 'test_helper'

class ProjectControllerTest < ActionController::TestCase
  def setup
    @controller = ProjectsController.new
  end
  test "should get index" do
    get :index
    assert_response :found
  end

end
