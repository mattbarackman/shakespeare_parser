require 'spec_helper'

describe Speech do

  let(:speech) {create(:speech)}

  it {should belong_to(:scene)}
  it {should validate_presence_of(:scene_id)}
  it {should have_and_belong_to_many(:roles)}
  it {should have_many(:lines)}

  it "should correctly count the number of lines it has" do
    3.times {speech.lines << create(:line)}
    expect(speech.total_lines).to be(3)
  end

  it "should correctly return its full text" do
    3.times {speech.lines << create(:line)}
    expect(speech.full_text).to eq("what a wonderful line. what a wonderful line. what a wonderful line.")
  end

end