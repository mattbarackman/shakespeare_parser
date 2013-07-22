require 'spec_helper'

describe Importer do

  let(:doc) {
    file = File.open('spec/fixtures/test_play.xml')
    doc = Nokogiri::XML(file)
  }

  let (:tags) {
    { play: "PLAY",
      title: "TITLE",
      act: "ACT",
      scene: "SCENE",
      speech: "SPEECH",
      line: "LINE",
      speaker: "SPEAKER"
    }
  }

  it "should create a play" do
    expect{Importer.parse_play(doc, tags)}.to change{Play.all.count}.from(0).to(1)
  end

  it "should create the correct number of roles" do
    expect{Importer.parse_play(doc, tags)}.to change{Role.all.count}.from(0).to(10)
  end

  it "should create the correct number of acts" do
    expect{Importer.parse_play(doc, tags)}.to change{Act.all.count}.from(0).to(2)
  end

  it "should create the correct number of scenes" do
    expect{Importer.parse_play(doc, tags)}.to change{Scene.all.count}.from(0).to(4)
  end

  it "should create the correct number of lines" do
    expect{Importer.parse_play(doc, tags)}.to change{Line.all.count}.from(0).to(27)
  end

  it "should associate the correct number of lines with each role" do
    Importer.parse_play(doc, tags)
    expect(Role.all[0].number_of_lines).to eq(5)
    expect(Role.all[1].number_of_lines).to eq(9)
    expect(Role.all[2].number_of_lines).to eq(3)
    expect(Role.all[3].number_of_lines).to eq(3)
    expect(Role.all[4].number_of_lines).to eq(2)
    expect(Role.all[5].number_of_lines).to eq(3)
    expect(Role.all[6].number_of_lines).to eq(1)
    expect(Role.all[7].number_of_lines).to eq(1)
    expect(Role.all[8].number_of_lines).to eq(1)
    expect(Role.all[9].number_of_lines).to eq(3)
  end

  it "should create the correct number of speeches" do
    expect{Importer.parse_play(doc, tags)}.to change{Speech.all.count}.from(0).to(13)
  end

  it "should associate the correct number of speeches with each role" do
    Importer.parse_play(doc, tags)
    expect(Role.all[0].number_of_scenes).to eq(2)
    expect(Role.all[1].number_of_scenes).to eq(3)
    expect(Role.all[2].number_of_scenes).to eq(1)
    expect(Role.all[3].number_of_scenes).to eq(1)
    expect(Role.all[4].number_of_scenes).to eq(2)
    expect(Role.all[5].number_of_scenes).to eq(1)
    expect(Role.all[6].number_of_scenes).to eq(1)
    expect(Role.all[7].number_of_scenes).to eq(1)
    expect(Role.all[8].number_of_scenes).to eq(1)
    expect(Role.all[9].number_of_scenes).to eq(1)
  end

  it "should associate a speech with the number of people speaking it" do
    Importer.parse_play(doc, tags)
    expect(Speech.last.roles.count).to eq(2)
  end

end