require 'spec_helper'

describe Role do

  let(:role) {create(:role)}
  let!(:speech_1) {create(:speech)}
  let!(:speech_2) {create(:speech)}
  let!(:speech_3) {create(:speech)}

  it { should have_and_belong_to_many(:scenes) }
  it { should have_and_belong_to_many(:speeches) }
  it { should validate_presence_of(:name) }

  it "should update stats for a role's longest_speech and number_of_lines" do
    speech_1.lines << create(:line)
    speech_1.lines << create(:line)
    role.speeches << speech_1

    speech_2.lines << create(:line)
    speech_2.lines << create(:line)
    role.speeches << speech_2

    expect{Role.update_stats!}.to change{Role.last.longest_speech_id}

    speech_3.lines << create(:line)
    speech_3.lines << create(:line)
    role.speeches << speech_3
    expect{Role.update_stats!}.to change{Role.last.number_of_lines}.by(2)    
  end

  it "should return a role's total number of scenes" do    
    expect{role.scenes << create(:scene)}.to change{role.number_of_scenes}.by(1)
  end

  it "should return a role's longest speech and speech length" do
    speech_1.lines << create(:line)
    speech_1.lines << create(:line)
    role.speeches << speech_1

    speech_2.lines << create(:line)
    role.speeches << speech_2

    Role.update_stats!
    expect(Role.last.longest_speech).to eq(speech_1)
    expect(Role.last.longest_speech.total_lines).to eq(2)
  end

  it "should return the percentage of scenes for a role" do
    role.stub(:number_of_scenes) { 5 }
    Scene.stub(:total_scenes) { 20 }
    expect(role.percentage_of_scenes).to eq(25)
  end

  it "should return a list of top 10 roles in alphabetical asc order" do
    names = %w(aaron brian casey david ernie frank george howard isla jackie leo)
    names.each {|name| create(:role, name: name)}
    expect(Role.alphabetical("asc").count).to be(10)
    expect(Role.alphabetical("asc").first.name).to eq('aaron')
  end

  it "should return a list of top 10 roles in alphabetical desc order" do
    names = %w(aaron brian casey david ernie frank george howard isla jackie leo)
    names.each {|name| create(:role, name: name)}
    expect(Role.alphabetical("desc").count).to be(10)
    expect(Role.alphabetical("desc").first.name).to eq('leo')
  end

end