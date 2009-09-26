require File.dirname(__FILE__) + '/../spec_helper'

describe Level do
  it "should not be valid" do
    Factory.build(:invalid_level).should_not be_valid
  end
  
  it "should be valid" do
    Factory(:level).should be_valid
  end

  it "should be not valid if has same name than other" do 
    Factory.create(:level, :name => "test").should be_valid
    Factory.build(:level, :name => "test").should_not be_valid
  end
end
