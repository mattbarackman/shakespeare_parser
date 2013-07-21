class Line < ActiveRecord::Base

  validates_presence_of :speech_id, :content

  belongs_to :speech

  attr_accessible :speech_id, :content
end