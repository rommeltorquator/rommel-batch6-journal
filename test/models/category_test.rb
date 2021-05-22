require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "valid category" do
    assert categories(:one).valid?
  end

  test "invalid without title" do # add presence: true
    categories(:one).title = nil
    refute categories(:one).valid?
  
    assert_not_nil categories(:one).errors[:title]
  end

  test "invalid without description" do # add presence: true
    categories(:one).description = nil
    refute categories(:one).valid?
  
    assert_not_nil categories(:one).errors[:description]
  end

  test "invalid without user" do # add presence: true
    categories(:one).user = nil
    refute categories(:one).valid?
  
    assert_not_nil categories(:one).errors[:user]
  end
end

