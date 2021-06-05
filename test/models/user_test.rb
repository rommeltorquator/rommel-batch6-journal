# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
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

  test "must be unique email" do
    user = users(:one)
    refute user.valid?
  end
end
