require File.dirname(__FILE__) + '/../spec_helper'

describe Statement do
  fixtures :statements

  it "should not be valid" do
    Statement.new.should_not be_valid
  end
end
