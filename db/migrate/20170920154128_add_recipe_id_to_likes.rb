class AddRecipeIdToLikes < ActiveRecord::Migration
  def change
    add_column :likes, :recipe_id, :integer
  end
end
