class RemoveCategoryIdFromTasks < ActiveRecord::Migration[6.1]
  def change
    remove_column :tasks, :category_id, :bigint
  end
end
