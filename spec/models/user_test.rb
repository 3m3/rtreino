require File.dirname(__FILE__) + '/../spec_helper'

describe User do
  fixtures :users

  it "should not be valid" do
    User.new.should_not be_valid
  end
end
