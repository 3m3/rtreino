require File.dirname(__FILE__) + '/../spec_helper'

describe Category do
  fixtures :categories

  it "should not be valid" do
    Category.new.should_not be_valid
  end
end
