# == Schema Information
#
# Table name: tasks
#
#  id          :bigint           not null, primary key
#  title       :string
#  description :text
#  deadline    :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint           not null
#  status      :integer          default("in_progress")
#
class Task < ApplicationRecord
  enum status: { # do not forget to add default in the migration file
    in_progress: 0,
    completed: 1
  }

  belongs_to :category
  validates :title, :description, :deadline, :category_id, presence: true
  validates :description, length: { minimum: 5, maximum: 35 }
  validate :not_past_date, on: :create

  # has_many :users
  has_many :users, through: :categories

  scope :in_progress, -> { where(status: "in_progress") }
  scope :completed, -> { where(status: "completed") }
  scope :less_than_today, -> { where("deadline < ?", DateTime.current.beginning_of_day) }

  private
  def not_past_date
    return if deadline.nil? || deadline.today?

    if deadline.past?
        return errors.add(:deadline, "must be valid")
    end
  end
end
