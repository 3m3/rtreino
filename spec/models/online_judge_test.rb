require File.dirname(__FILE__) + '/../spec_helper'

describe OnlineJudge do
  it "should be valid" do
    Factory.create(:online_judge).should be_valid
  end

  it "should not be valid" do
    Factory.build(:invalid_online_judge).should_not be_valid
  end

  it "should not be valid with not has name field" do
    Factory.build(:online_judge, :name => nil).should_not be_valid
  end

  it "should not be valid if has another online judge with the same name" do
    Factory.create(:online_judge, :name => "UVA").should be_valid
    Factory.build(:online_judge, :name => "UVA").should_not be_valid
  end
end
