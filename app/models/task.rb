class Task < ApplicationRecord
    belongs_to :category    
    validates :title, :description, :deadline, presence: true
end
