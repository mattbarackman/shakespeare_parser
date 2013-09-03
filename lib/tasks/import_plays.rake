
def import_play(file_path, tags)
  file = File.open(file_path)
  doc = Nokogiri::XML(file)
  Importer.parse_play(doc, tags)
  file.close
end

namespace :import do
  desc "Import the Julius Caesar XML into Database"
  task :play => :environment do
    tags = { play: "PLAY",
             title: "TITLE",
             act: "ACT",
             scene: "SCENE",
             speech: "SPEECH",
             line: "LINE",
             speaker: "SPEAKER"
           }

    import_play("lib/tasks/plays/#{ARGV.last}", tags)
  end
end

desc "No operation task for file name"
task ARGV.last.to_sym do
  # no operation. needed b/c rake tries running 
  # a rake task associated with all arguments,
  # including the name of the file.
end
