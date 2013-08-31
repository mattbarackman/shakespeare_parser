class Role < ActiveRecord::Base

  validates_presence_of :name
  
  belongs_to :play
  has_and_belongs_to_many :speeches
  has_and_belongs_to_many :scenes

  attr_accessible :name, :number_of_lines, :longest_speech_id

  def number_of_scenes
    scenes.count
  end

  def longest_speech
    Speech.find(longest_speech_id)
  end

  def longest_speech_length
    longest_speech.total_lines
  end

  def percentage_of_scenes
    (100 * number_of_scenes / Scene.total_scenes.to_f).round
  end

  def self.update_stats!
    self.all.each do |role|
      role.number_of_lines = role.speeches.inject(0) {|sum, speech| sum += speech.total_lines}
      role.longest_speech_id = role.speeches.sort_by {|x| x.total_lines}.last.id
      role.save
    end
  end

  ### makes names consistent

  def self.canonicalize(name)
      name.titleize
  end

end