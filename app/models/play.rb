class Play < ActiveRecord::Base

  validates_presence_of :title
  has_many :acts

  attr_accessible :title
    
end