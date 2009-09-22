require File.dirname(__FILE__) + '/../spec_helper'

describe Problem do

  it "should be valid" do
    problem = Factory.create(:problem)
    problem.should be_valid
  end
end
