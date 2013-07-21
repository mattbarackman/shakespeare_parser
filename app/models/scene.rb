class Scene < ActiveRecord::Base

  validates_presence_of :act_id, :title
  belongs_to :act
  has_many :speeches
  has_and_belongs_to_many :roles
  attr_accessible :act_id, :title, :created_at, :updated_at

  def self.total_scenes
    all.count
  end

  def scene_number
    title.split(".").first
  end

  def to_s
    title
  end

end