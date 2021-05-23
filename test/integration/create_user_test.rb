require "test_helper"

class CreateUserTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test 'should go to register form and create a user' do
    get new_user_registration_path
    assert_response :success

    assert_difference 'User.count', 1 do
      post user_registration_path, params: { user: { email: "toshi@gmail.com", password: "123456", password_confirmation: '123456' } }

      assert_response :redirect
    end

    follow_redirect!
    assert_response :success
  end
end
