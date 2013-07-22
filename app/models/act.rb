class Act < ActiveRecord::Base

  validates_presence_of :play_id, :title 
  
  belongs_to :play
  has_many :scenes

  attr_accessible :play_id, :title

  def to_s
    title
  end

end