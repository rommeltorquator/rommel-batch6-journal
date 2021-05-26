require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index page" do
    get root_path
    assert_response :success
  end

  test "should show the primary heading" do
    get root_path
    assert_response :success

    assert_select 'h1', 'Organize your life efforlessly'
  end

  test "should show the primary paragraph" do
    get root_path
    assert_response :success

    assert_select 'h5', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolorem, ullam quos cum nostrum culpa nobis sit nam ex asperiores quis!'
  end

  test "must show the png image" do
    get root_path
    assert_response :success

    assert_select 'img'
  end

  # assert_select 'nav.side_nav a', minimum: 4
  #   assert_select 'main ul.catalog li', 3
  #   assert_select 'h2', 'Programming Ruby 1.9'
  #   assert_select '.price', /\$[,\d]+\.\d\d/
  #   assert_select 'h2', Time.now
end
