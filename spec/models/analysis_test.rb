require File.dirname(__FILE__) + '/../spec_helper'

describe Analysis do
  fixtures :analyses

  it "should not be valid" do
    Analysis.new.should_not be_valid
  end
end
