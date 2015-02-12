class AddDeveloperIdsToStories < ActiveRecord::Migration
  def change
    add_column :stories, :developer1_id, :integer
    add_column :stories, :developer2_id, :integer
  end
end
