require File.dirname(__FILE__) + '/../spec_helper'

describe Level do
  fixtures :levels

  it "should be valid" do
    Comment.new.should be_valid
  end
end
