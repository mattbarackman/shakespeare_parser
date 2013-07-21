require 'spec_helper'

describe Act do

  it {should validate_presence_of(:play_id)}
  it {should validate_presence_of(:title)}
  it {should belong_to(:play)}
  it {should have_many(:scenes)}

end