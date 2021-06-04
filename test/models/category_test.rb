# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  title      :string
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string
#
require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  # test "valid category" do
  #   assert categories(:one).valid?
  # end

  # test "invalid without title" do # add presence: true
  #   categories(:one).title = nil
  #   refute categories(:one).valid? # must be false
  
  #   assert_not_nil categories(:one).errors[:title]
  # end

  # test "invalid without description" do # add presence: true
  #   categories(:one).description = nil
  #   refute categories(:one).valid? # must be false
  
  #   assert_not_nil categories(:one).errors[:description]
  # end

  # test "invalid without user" do # add presence: true
  #   categories(:one).user = nil
  #   refute categories(:one).valid? # must be false
  
  #   assert_not_nil categories(:one).errors[:user]
  # end

  test "valid category" do
    assert categories(:one).valid?
  end

  test "should not save category without title" do
    category = Category.new(description: "Description", user: users(:one))
    assert_not category.save, 'saved category even without title' # expect it to be false to pass the test
  end

  test "should not save category without description" do
    category = Category.new(title: "First category", user: users(:one))
    assert_not category.save, 'saved category even without description' # expect it to be false to pass the test
  end

  test "should not save category without user" do
    category = Category.new(title: "First title", description: "Description")
    assert_not category.save, 'saved category even without user' # expect it to be false to pass the test
  end
end

