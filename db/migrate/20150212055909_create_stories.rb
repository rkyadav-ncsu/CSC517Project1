class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title
      t.string :description
      t.integer :pointValue
      t.string :stage
      t.string :developer1
      t.string :developer2
      t.references :project
      t.string :createdBy

      t.timestamps
    end
  end
end
