require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  def setup
    @project = Project.new(name: "test", description: "test project")
  end

  test "Name should not be null" do
    @project.name = ""
    assert_not @project.valid?
  end

end
