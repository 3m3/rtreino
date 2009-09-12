require File.dirname(__FILE__) + '/../spec_helper'

describe Category do
  fixtures :categories

  it "should be valid" do
    Comment.new.should be_valid
  end
end
