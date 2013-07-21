require 'spec_helper'

describe Scene do

  let(:scene) {create(:scene)}

  it {should validate_presence_of(:title)}
  it {should belong_to(:act)}
  it {should have_many(:speeches)}
  it {should have_and_belong_to_many(:roles)}

  it "should return the sum of all the scenes" do
    10.times {create(:scene)}
    expect(Scene.total_scenes).to be(10)
  end

  it "should be able to parse its scene number" do
    expect(scene.scene_number).to eq("Scene I")
  end

end