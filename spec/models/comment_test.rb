require File.dirname(__FILE__) + '/../spec_helper'

describe Comment do
  fixtures :comments

  it "should be valid" do
    Comment.new.should be_valid
  end
end