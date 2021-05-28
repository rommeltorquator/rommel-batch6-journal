class Category < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy

  validates :title, :user, presence: true
  validates :title, length: { maximum: 20 }
end
