class User < ActiveRecord::Base
  #attr_accessible :name, :email, :developer, :admin
  has_one :stories
  belongs_to :project
  validates :name, :presence => true
  validates :email, :presence => true
  validates_numericality_of :developer, allow_nil: true
  validates_numericality_of :admin, allow_nil: true
  has_secure_password
  validate :developer_or_admin
  private
  def developer_or_admin
    if(!developer? and !admin?)
      errors.add(:base, "A user must be at least a developer or an admin");
    end
  end
end