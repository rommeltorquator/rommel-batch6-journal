require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "can access categories index when logged in" do # index
    sign_in users(:one)
    # sign_out users(:one)

    get categories_path
    assert_response :success
  end

  test "must be able to access show category page when logged in" do # show
    sign_in users(:one)

    get category_path(categories(:one))
    assert_response :success
  end

  test "should be able to access new category page when logged in" do # new
    sign_in users(:one)

    get new_category_path
    assert_response :success
  end

  test "should create category when logged in" do # create
    sign_in users(:one)

    post categories_path, params: { 
      category: {
        title: "First category",
        description: "First description",
        user_id: users(:one)
      }
    }
    assert_redirected_to category_path(Category.last) # must redirect to show page showing the latest category created
  end

  test "should be able to access edit page when logged in" do # edit
    sign_in users(:one)

    get edit_category_path(categories(:one))
    assert_response :success
  end

  test "should update category when logged in" do # update
    sign_in users(:one)

    patch category_path(categories(:one)), params: { 
      category: {
        title: "Second category",
        description: "Second description",
        user_id: users(:two)
      }
    }
    assert_redirected_to category_path(categories(:one)) # must redirect to show page showing the latest category created
  end

  test "should destroy category only when logged in" do # destroy
    sign_in users(:one)

    delete category_path(categories(:one))
    assert_redirected_to categories_path # must redirect to categories index page
  end

  # if user is not logged in
  
  test "must redirect to login page when user is not logged in trying to access categories index" do # index
    get categories_path
    assert_response :redirect
  end

  test "must redirect to login page when user is not logged in trying to access a category" do # show
    get category_path(categories(:one))
    assert_response :redirect
  end

  test "must redirect to login page when user is not logged in trying to create a new category" do # new
    get new_category_path
    assert_response :redirect
  end

  test "must redirect to login page when user is not logged in trying to update a category" do # new
    patch category_path(categories(:one))
    assert_response :redirect
  end
end