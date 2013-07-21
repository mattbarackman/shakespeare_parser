class Play < ActiveRecord::Base

  validates_presence_of :title
  has_many :acts
  has_many :roles

  attr_accessible :title
    
end