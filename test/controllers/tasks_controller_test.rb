require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @category = categories(:one)
  end

  test "should show task create form" do
    sign_in users(:one)

    get categories_path
    assert_response :success
  end

  test "should go to index page after logging out" do
    sign_in users(:one)

    get categories_path
    assert_response :success

    sign_out users(:one)
    assert_response :success
  end

  test "should show the tasks under a category" do
    sign_in users(:one)

    get categories_path
    assert_response :success

    get category_path(@category)
    assert_response :success
  end

  test "should show a specific category after logging in" do
    sign_in users(:one)
    get category_path(@category)

    assert_response :success
  end

  test "should be able to logout while seeing the tasks" do
    sign_in users(:one)

    get categories_path
    assert_response :success

    get category_path(@category)
    assert_response :success

    sign_out users(:one)
    assert_response :success
  end
end
