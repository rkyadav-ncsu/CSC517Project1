class User < ActiveRecord::Base
  #attr_accessible :name, :email, :developer, :admin
  validates :name, :presence => true
  validates :email, :presence => true
  has_secure_password
end