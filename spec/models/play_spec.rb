require 'spec_helper'

describe Play do

  it {should validate_presence_of(:title)}
  it {should have_many(:acts)}

end
