class Developer < ActiveRecord::Base
  #attr_accessible :name, :email, :password
  validates :name, :presence => true
  validates :email, :presence => true
  validates :password, :presence => true
end