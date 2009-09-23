require File.dirname(__FILE__) + '/../spec_helper'

describe Level do
  it "should not be valid" do
    Factory.build(:invalid_level).should_not be_valid
  end
  
  it "should be valid" do
    Factory(:level).should be_valid
  end
end
