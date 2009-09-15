require File.dirname(__FILE__) + '/../spec_helper'

describe UserSession do
  fixtures :user_sessions

  it "should be valid" do
    Comment.new.should be_valid
  end
end
