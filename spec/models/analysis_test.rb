require File.dirname(__FILE__) + '/../spec_helper'

describe Analysis do
  it "should not be valid" do
    Factory.build(:invalid_analysis).should_not be_valid
  end

  it "should be valid" do
    Factory.create(:analysis).should be_valid
  end

  it "without problem association should not be valid" do
    Factory.build(:analysis, :problem => nil).should_not be_valid
  end

  it "without creator association should not be valid" do
    Factory.build(:analysis, :creator => nil).should_not be_valid
  end

  it "without updater association should not be valid" do
    Factory.build(:analysis, :updater => nil).should_not be_valid
  end

  it "without body text should not be valid" do
    Factory.build(:analysis, :body => nil).should_not be_valid
  end
end
