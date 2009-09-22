require File.dirname(__FILE__) + '/../spec_helper'

describe Comment do
  fixtures :comments

  it "should not be valid" do
    Comment.new.should_not be_valid
  end
end
