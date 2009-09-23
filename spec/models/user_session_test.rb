require File.dirname(__FILE__) + '/../spec_helper'

describe UserSession do
  it "should be valid" do
    activate_authlogic
    UserSession.create(Factory(:user)).should be_valid
  end
end
