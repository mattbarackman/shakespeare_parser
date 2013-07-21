class Importer

  def self.parse_play(doc)
    play = Play.create(title: doc.css("PLAY > TITLE").inner_text)
    play_xml = doc.css("PLAY")
    self.parse_roles(play_xml)
    self.parse_acts(play, play_xml)
    Role.update_stats!
  end

 def self.parse_roles(play_xml)
   roles = unique_roles(play_xml.css("SPEAKER"))

   roles.each do |role|
    Role.create(name: role)
   end
 end

 def self.unique_roles(roles)
  roles.map {|role| role.inner_text}.uniq!
 end

 def self.parse_acts(play, play_xml)
   acts =  play_xml.css("ACT")
   acts.each do |act_xml|
     title = act_xml.css("> TITLE").inner_text
     act = play.acts.create(title: title)
     self.parse_scenes(act, act_xml)
   end
 end

 def self.parse_scenes(act, act_xml)
  scenes =  act_xml.css("SCENE")
  scenes.each do |scene_xml|
    title = scene_xml.css("> TITLE").inner_text
    scene = act.scenes.create(title: title)
    self.parse_speeches(scene, scene_xml)
  end
 end

 def self.parse_speeches(scene, scene_xml)
  speeches =  scene_xml.css("SPEECH")
  speeches.each do |speech_xml|
    speech = Speech.new(scene_id: scene.id)
    role_names = speech_xml.css("> SPEAKER").map{|role| role.inner_text}
    role_names.each do |role_name|
      role = Role.find_by_name(role_name)
      role.scenes << scene unless role.scenes.include? scene
      role.speeches << speech
      role.save
    end
    self.parse_lines(speech, speech_xml)
  end
 end

 def self.parse_lines(speech, speech_xml)
  lines =  speech_xml.css("LINE")
  lines.each do |line_xml|
    content = line_xml.inner_text
    speech.lines.create(content: content)
  end
 end
end