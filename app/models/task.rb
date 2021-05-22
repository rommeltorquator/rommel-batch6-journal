class Task < ApplicationRecord
    belongs_to :category
    validates :title, :description, :deadline, :category_id, presence: true
end
