require File.dirname(__FILE__) + '/../spec_helper'

describe User do
  fixtures :users

  it "should be valid" do
    Comment.new.should be_valid
  end
end