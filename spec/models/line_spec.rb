require 'spec_helper'

describe Line do

  it {should belong_to(:speech)}
  it {should validate_presence_of(:content)}
  it {should validate_presence_of(:speech_id)}

end
