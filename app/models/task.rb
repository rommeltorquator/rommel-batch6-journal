class Task < ApplicationRecord
    enum status: { # do not forget to add default in the migration file
        in_progress: 0,
        completed: 1
    }

    # Blog.first.published?
    # Blog.first.draft?
    # Blog.first.published!
    # Blog.first.draft!

    belongs_to :category
    validates :title, :description, :deadline, :category_id, presence: true
end
