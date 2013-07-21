
namespace :import do
  desc "Import the Julius Caesar XML into Database"
  task :j_caesar => :environment do
     file = File.open('lib/tasks/plays/j_caesar.xml')
     doc = Nokogiri::XML(file)
     Importer.parse_play(doc)
     file.close
  end
end
