require File.dirname(__FILE__) + '/../spec_helper'

describe Language do
  it "should not be valid" do
    Factory.build(:invalid_language).should_not be_valid
    Factory.build(:language, :abbreviation => "pt_br").should_not be_valid
    Factory.build(:language, :abbreviation => "_br").should_not be_valid
  end

  it "should be valid" do
    Factory(:language).should be_valid
  end

  it "should be not valid if has the same name of the other" do
    Factory.create(:language, :name => "test").should be_valid
    Factory.build(:language, :name => "test").should_not be_valid
  end

  it "should be not valid if has the same abbrevition than other" do
    Factory.create(:language, :abbreviation => "pt_BR").should be_valid
    Factory.build(:language, :abbreviation => "pt_BR").should_not be_valid
   end
end
