
def import_play(file_path, tags)
  file = File.open(file_path)
  doc = Nokogiri::XML(file)
  Importer.parse_play(doc, tags)
  file.close
end

namespace :import do
  desc "Import the Julius Caesar XML into Database"
  task :j_caesar => :environment do
    tags = { play: "PLAY",
             title: "TITLE",
             act: "ACT",
             scene: "SCENE",
             speech: "SPEECH",
             line: "LINE",
             speaker: "SPEAKER"
           }

    import_play('lib/tasks/plays/j_caesar.xml', tags)
  end
end

