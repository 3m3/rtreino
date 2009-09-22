require File.dirname(__FILE__) + '/../spec_helper'

describe Language do
  fixtures :languages

  it "should not be valid" do
    Language.new.should_not be_valid
  end
end
