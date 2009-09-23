require File.dirname(__FILE__) + '/../spec_helper'

describe Language do
  it "should not be valid" do
    Factory.build(:invalid_category).should_not be_valid
  end

  it "should be valid" do
    Factory(:category).should be_valid
  end
end
