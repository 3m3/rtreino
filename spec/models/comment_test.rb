require File.dirname(__FILE__) + '/../spec_helper'

describe Comment do
  it "should not be valid" do
    Factory.build(:invalid_comment).should_not be_valid
  end

  it "from analysis should be valid" do
    Factory.create(:comment_from_analysis).should be_valid
  end

  it "from other comment should be valid" do
    Factory.create(:comment_from_comment).should be_valid
  end
end
