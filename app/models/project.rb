class Project < ActiveRecord::Base
  has_many :stories
  #  t.string :name   t.string :description  t.datetime :createdOn  t.boolean :isActive  t.string :createdBy
  validates :name, :presence => true
end
