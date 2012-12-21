require 'test_helper'

class MarkdownControllerTest < ActionController::TestCase
  test "should get raw" do
    get :raw
    assert_response :success
  end

end
