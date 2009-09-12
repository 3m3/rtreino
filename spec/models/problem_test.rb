require File.dirname(__FILE__) + '/../spec_helper'

describe Problem do
  fixtures :problems

  it "should be valid" do
    Comment.new.should be_valid
  end
end
