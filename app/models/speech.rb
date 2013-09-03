class Speech < ActiveRecord::Base

  validates_presence_of :scene_id

  belongs_to :scene
  has_and_belongs_to_many :roles
  has_many :lines

  attr_accessible :scene_id

  def total_lines
    lines.count
  end

  def full_text
    lines.map {|line| line.content}.join(" ")
  end

  def display
    "#{format_reference} #{full_text}..."
  end

  private

  def format_reference
    "#{scene.act}, #{scene.scene_number}:"
  end
  
end