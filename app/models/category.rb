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
class Category < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy

  validates :title, :user, presence: true
  validates :title, length: { maximum: 30 }
  validate :unique_category, on: :create # unique category per user

  extend FriendlyId
  friendly_id :title, use: :slugged

  private
  def unique_category
    results = user.categories.where(title: title)
    errors.add(:title, " already exists") if results.present?
  end
end
