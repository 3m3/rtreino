require File.dirname(__FILE__) + '/../spec_helper'

describe Language do
  fixtures :languages

  it "should be valid" do
    Comment.new.should be_valid
  end
end
