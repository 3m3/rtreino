require File.dirname(__FILE__) + '/../spec_helper'

describe Analysis do
  fixtures :analyses

  it "should be valid" do
    Comment.new.should be_valid
  end
end
