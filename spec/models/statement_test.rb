require File.dirname(__FILE__) + '/../spec_helper'

describe Statement do
  it "should not be valid" do
    Factory.build(:invalid_statement).should_not be_valid
  end

  it "should be valid" do
    Factory.create(:statement).should be_valid
  end

  it "without problem association should not be valid" do
    Factory.build(:statement, :problem_id => nil).should_not be_valid
  end

  it "should not be valid if have another statement with the same language for your problem" do
    statement_first = Factory.create(:statement)
    Factory.build(:statement, 
      :language_id => statement_first.language_id, 
      :problem_id => statement_first.problem_id).should_not be_valid
  end

  it "should not be valid if hasn't creator" do
    Factory.build(:statement, :creator => nil).should_not be_valid
  end

  it "should not be valid if hasn't updater" do
    Factory.build(:statement, :updater => nil).should_not be_valid
  end
end
