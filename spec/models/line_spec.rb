require 'spec_helper'

describe Line do

  it {should validate_presence_of(:content)}
  it {should validate_presence_of(:speech_id)}
  it {should belong_to(:speech)}

end
