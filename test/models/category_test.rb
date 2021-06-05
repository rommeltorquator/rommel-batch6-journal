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

  test "valid category" do
    category = categories(:one)
    assert category.valid?
  end

  test "should not save category without title" do
    category = Category.new(user: users(:one))
    assert_not category.save, 'saved category even without title' # expect it to be false to pass the test
  end

  test "user id must be included" do
    category = users(:one).categories.new(title: "This is the title")
    assert category.valid?
  end

  test "title must be unique" do
    category = users(:one).categories.create(title: categories(:one).title)
    assert category.invalid?
  end
end

