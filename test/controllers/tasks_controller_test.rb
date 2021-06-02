require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @category = categories(:one)
    @task = @category.tasks.create(title: "This is it", description: "This is the description", deadline: "2021-24-05 19:36:14")
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

  test "should destroy a task" do
    sign_in users(:one)
    # sign_out users(:one)

    get categories_path
    assert_response :success

    assert_difference('Task.count', -1) do
      delete task_path(tasks(:one))
    end

    assert_response :redirect
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
