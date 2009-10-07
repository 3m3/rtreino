require File.dirname(__FILE__) + '/../spec_helper'

describe LogModel do
  before(:each) do
    @log = LogModel.new(:loggable_id => 1, :loggable_type => 'Problem', :action => :create)
  end
  it "should not be valid" do
    LogModel.new.should_not be_valid
  end

  it "without loggable_id should not be valid" do
    @log.loggable_id = nil
    @log.should_not be_valid
  end

  it "without loggable_type should not be valid" do
    @log.loggable_type = nil
    @log.should_not be_valid
  end

  it "without action should not be valid" do
    @log.action = nil
    @log.should_not be_valid
  end
end

