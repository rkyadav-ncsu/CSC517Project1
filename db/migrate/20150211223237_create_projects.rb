class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description
      t.datetime :createdOn
      t.boolean :isActive
      t.string :createdBy

      t.timestamps
    end
  end
end
