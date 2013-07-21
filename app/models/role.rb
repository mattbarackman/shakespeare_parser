class Role < ActiveRecord::Base

  validates_presence_of :name
  has_and_belongs_to_many :speeches
  has_and_belongs_to_many :scenes
  # has_one :longest_speech, class_name: 'Speech', foreign_key: 'id' 

  attr_accessible :name, :number_of_lines, :longest_speech_id

  scope :alphabetical, order(:name).limit(10)

  scope :longest_speeches, order(:longest_speech_length).limit(10)

  def self.alphabetical(direction)
    if direction == "asc"
      self.order(:name).first(10)
    else
      self.order(:name).last(10).reverse
    end
  end

  def self.line_count(direction)
    if direction == "asc"
      self.order("number_of_lines ASC").limit(10)
    else
      self.order("number_of_lines DESC").limit(10)
    end
  end

  def self.longest_speeches(direction)
    if direction == "asc"
      all.sort_by {|role| role.longest_speech_length}.first(10)
    else
      all.sort_by {|role| role.longest_speech_length}.reverse.first(10)
    end
  end

  def self.scene_count(direction)
    if direction == "asc"
      all.sort_by {|role| role.number_of_scenes}.first(10)
    else
      all.sort_by {|role| role.number_of_scenes}.reverse.first(10)
    end
  end

  def self.percentage_of_scenes(direction)
    if direction == "asc"
      all.sort_by {|role| role.percentage_of_scenes}.first(10)
    else
      all.sort_by {|role| role.percentage_of_scenes}.reverse.first(10)
    end
  end

  def self.update_stats!
    self.all.each do |role|
      role.number_of_lines = role.speeches.inject(0) {|sum, speech| sum += speech.total_lines}
      role.longest_speech_id = role.speeches.sort_by {|x| x.total_lines}.last.id
      role.save
    end
  end

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

end