class Story < ActiveRecord::Base
  #attr_accessible :developer1_name, :developer2_name
  belongs_to :project
  belongs_to :developer1, :class_name => 'User'
  belongs_to :developer2, :class_name => 'User'
  validates :title, :presence => true
  validates :project, :presence => true
  def self.search(search)
    if search
      find(:all, :conditions => ['title LIKE ? or description like ?', "%#{search}%","%#{search}%"])
    else
      find(:all)
    end
  end
end
