class Project < ActiveRecord::Base
  #  t.string :name   t.string :description  t.datetime :createdOn  t.boolean :isActive  t.integer :createdBy
  validates :name, :presence => true
  validates :createdBy,:presence =>true
end
