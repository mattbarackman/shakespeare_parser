class Importer

  def self.parse_play(doc, tags)
    @tags = tags
    play = Play.create(title: doc.css("#{@tags[:play]} > #{@tags[:title]}").inner_text)
    play_xml = doc.css("#{@tags[:play]}")
    self.parse_roles(play, play_xml)
    self.parse_acts(play, play_xml)
    Role.update_stats!
  end

 def self.parse_roles(play, play_xml)
   roles = unique_roles(play_xml.css("#{@tags[:speaker]}"))

   roles.each do |role|
    play.roles << Role.create(name: Role.canonicalize(role))
   end
 end

 def self.unique_roles(roles)
  roles.map {|role| role.inner_text}.uniq!
 end

 def self.parse_acts(play, play_xml)
   acts =  play_xml.css("ACT")
   acts.each do |act_xml|
     title = act_xml.css("> #{@tags[:title]}").inner_text
     act = play.acts.create(title: title)
     self.parse_scenes(act, act_xml)
   end
 end

 def self.parse_scenes(act, act_xml)
  scenes =  act_xml.css("#{@tags[:scene]}")
  scenes.each do |scene_xml|
    title = scene_xml.css("> #{@tags[:title]}").inner_text
    scene = act.scenes.create(title: title)
    self.parse_speeches(scene, scene_xml)
  end
 end

 def self.parse_speeches(scene, scene_xml)
  speeches =  scene_xml.css("#{@tags[:speech]}")
  speeches.each do |speech_xml|
    speech = Speech.new(scene_id: scene.id)
    role_names = speech_xml.css("> #{@tags[:speaker]}").map{|role| role.inner_text}
    role_names.each do |role_name|
      role = Role.find_by_name(Role.canonicalize(role_name))
      role.scenes << scene unless role.scenes.include? scene
      role.speeches << speech
      role.save
    end
    self.parse_lines(speech, speech_xml)
  end
 end

 def self.parse_lines(speech, speech_xml)
  lines =  speech_xml.css("#{@tags[:line]}")
  lines.each do |line_xml|
    content = line_xml.inner_text
    speech.lines.create(content: content)
  end
 end
end