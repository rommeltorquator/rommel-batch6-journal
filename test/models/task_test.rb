require "test_helper"

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "valid task" do
    assert tasks(:one).valid?
  end

  test "invalid without title" do # add presence: true
    tasks(:one).title = nil
    refute tasks(:one).valid?
  
    assert_not_nil tasks(:one).errors[:title]
  end

  test "invalid without description" do # add presence: true
    tasks(:one).description = nil
    refute tasks(:one).valid?
  
    assert_not_nil tasks(:one).errors[:description]
  end

  test "invalid without deadline" do # add presence: true
    tasks(:one).deadline = nil
    refute tasks(:one).valid?
  
    assert_not_nil tasks(:one).errors[:deadline]
  end

  test "invalid without category" do # add presence: true
    tasks(:one).category = nil
    refute tasks(:one).valid?
  
    assert_not_nil tasks(:one).errors[:category]
  end
end
