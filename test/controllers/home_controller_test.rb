require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index page" do
    get root_path
    assert_response :success
  end
end
