class AddDeveloperAndAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :developer, :boolean
    add_column :users, :admin, :boolean
  end
end
