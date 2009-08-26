require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Problems do
  before(:each) do
    @valid_attributes = {
      :id => "value for id",
      :name => "value for name",
      :source => "value for source"
    }
  end

  it "should create a new instance given valid attributes" do
    Problems.create!(@valid_attributes)
  end
end
