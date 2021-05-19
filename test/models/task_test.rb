require "test_helper"

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "valid task" do
    task = Task.new(title: "Clean room", description: "Clean your room using vacuum cleaner", deadline: "2021-05-19 13:52:33.691530")

    assert task.valid?
  end

  test "invalid without title" do # add presence: true
    task = Task.new(description: "Clean house")
    refute task.valid?

    assert_not_nil task.errors[:title]
  end

  test "invalid without description" do # add presence: true
    task = Task.new(title: "Clean house")
    refute task.valid?

    assert_not_nil task.errors[:description]
  end
end
