require File.dirname(__FILE__) + '/../spec_helper'

describe Category do

  it "should not be valid" do
    Category.new.should_not be_valid
  end

  it "should be valid" do
    Factory.create(:category).should be_valid
  end

  it "name should be unique" do
    Factory.create(:category, :name => "same_name").should be_valid
    Factory.build(:category, :name => "same_name").should_not be_valid
  end

  it "parent should not be child" do
    Factory.create(:category, :name => "foo", :category => nil).should be_valid
    category = Category.find_by_name("foo")
    category.category_id = category.id
    category.should_not be_valid
  end

end
