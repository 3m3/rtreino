require File.dirname(__FILE__) + '/../spec_helper'

describe Problem do
  fixtures :problems

  it "should not be valid" do
    Problem.new.should_not be_valid
  end
end
