class RemoveDescriptionFromCategories < ActiveRecord::Migration[6.1]
  def change
    remove_column :categories, :description, :text
  end
end
