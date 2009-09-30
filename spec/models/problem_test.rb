require File.dirname(__FILE__) + '/../spec_helper'

describe Problem do

  it "should be valid" do
    Factory.create(:problem).should be_valid
  end

  it "should not be valid if it has not name" do
    Factory.build(:problem, :name => nil).should_not be_valid
  end

  it "should not be valid if it has not source" do
    Factory.build(:problem, :source => nil).should_not be_valid
  end

  it "should not be valid if have spaces in code" do
    Factory.build(:problem, :source => "TEST TEST").should be_valid
  end

  it "should not be valif if haven't problem_type field" do
    Factory.build(:problem, :problem_type => nil).should_not be_valid
  end

end
