require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Level do
  before(:each) do
    @valid_attributes = {
      :description => "value for description"
    }
  end

  it "should create a new instance given valid attributes" do
    Level.create!(@valid_attributes)
  end
end
