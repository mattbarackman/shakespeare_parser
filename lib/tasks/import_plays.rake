
def import_play(file_path)
  file = File.open(file_path)
  doc = Nokogiri::XML(file)
  Importer.parse_play(doc)
  file.close
end

namespace :import do
  desc "Import the Julius Caesar XML into Database"
  task :j_caesar => :environment do
   import_play'lib/tasks/plays/j_caesar.xml'
  end
end

