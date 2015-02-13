class DropRecipesAndCategories < ActiveRecord::Migration
  def change
    drop_table :recipes
    drop_table :categories
  end
end
