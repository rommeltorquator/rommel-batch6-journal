require "test_helper"

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "valid task" do
    task = categories(:one).tasks.new(title: "MyString", description: "MyText is this", deadline: "2021-09-19 09:49:28", status: "in_progress")

    assert task.valid?
  end

  test "attributes must not be blank" do
    task = categories(:one).tasks.new(title: "", description: "", deadline: "", status: "")

    assert task.invalid?
  end

  test "title must not null" do
    task = categories(:one).tasks.new(title: "MyString", description: "MyText is this", deadline: "2021-09-19 09:49:28", status: "in_progress")

    assert task.valid?
  end

  test "description must not null" do
    task = categories(:one).tasks.new(title: "MyString", description: "MyText is this", deadline: "2021-09-19 09:49:28", status: "in_progress")

    assert task.valid?
  end

  test "deadline must not be past due" do
    task = categories(:one).tasks.new(title: "MyString", description: "MyText is this", deadline: "2021-04-19 09:49:28", status: "in_progress")

    assert task.invalid?
  end

  test "task title must be unique" do
    new_task = tasks(:one)

    refute new_task.valid?
  end
end
