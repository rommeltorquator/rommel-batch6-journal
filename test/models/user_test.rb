require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "valid user" do
    assert users(:one).valid?
  end

  test "invalid without email" do # add presence: true
    user(:one).email = nil
    refute user(:one).valid?
  
    assert_not_nil user(:one).errors[:email]
  end
end