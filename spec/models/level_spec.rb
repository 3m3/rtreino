require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Level do
  before(:each) do
    @valid_attributes = {
      :description => "value for description",
      :difficult_value => 2
    }
  end

  it "should create a new instance given valid attributes" do
    Level.create!(@valid_attributes)
  end

  it "Should not create a new instance if the difficult value is outside range [0,10]" do
    level = Level.new
    level.description = "Ovo com banana"
    level.difficult_value = -1
    level.save.should be_false
    

    level.difficult_value = 11
    level.save.should be_false
  end

  it "Should not create if it doesn't has a description name" do
    level = Level.new
    level.description = ""
    level.difficult_value = 3
    level.save.should be_false
  end

end 
