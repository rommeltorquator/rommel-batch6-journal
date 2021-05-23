require "test_helper"

class CategoriesFlowTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "can see the welcome page" do
    get "/"
    assert_select "h1", "Organize your life efforlessly"    
  end

  test "can create a category" do
    sign_in users(:one)

    get "/categories/new"
    assert_response :success

    post "/categories", params: { category: { title: "First Category", description: "First Description", user_id: users(:one) } }
    assert_response :redirect

    follow_redirect!
    assert_response :success
  end

  test "can show a category" do
    sign_in users(:one)

    get "/categories/#{categories(:one).id}"
    assert_response :success
  end

  test "can edit a category" do
    sign_in users(:one)

    get "/categories/#{categories(:one).id}/edit"
    assert_response :success

    patch "/categories/#{categories(:one).id}", params: { category: { title: "First Category, edited", description: "First Description, edited", user_id: users(:one) } }
    assert_response :redirect

    follow_redirect!
    assert_response :success
  end

  test "shows new task under a category" do
    sign_in users(:one)

    get "/categories/"
    assert_response :success
  
    get "/categories/#{categories(:one).id}"
    assert_response :success

    get "/tasks/new"
    assert_response :success
  end

  # test "can destroy a task related to a category" do
  #   sign_in users(:one)


  # end
end
