require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe User do
  before(:each) do
    @valid_attributes = {
      :login => "atol",
      :email => "atol@atol.com.cu",
      :password => "123456",
      :password_confirmation => "123456"
    }
    @atol = User.new(@valid_attributes)
  end

  it "Should not accept users with password different from password_confirmation" do
    @atol.password_confirmation = "234561"
    @atol.save.should be_false
  end 

  it "Should accept users with a valid login, valid email and password and password_confirmation equal" do
    @atol.password = @atol.password_confirmation = "123451"
    @atol.valid?.should be_true 
  end

  it "No field should not be empty" do
    @atol.password = ""
    @atol.password_confirmation = ""
    @atol.valid?.should be_false
    @atol.login = ""
    @atol.valid?.should be_false
    @atol.login = "atol"
    @atol.email = ""
    @atol.valid?.should be_false
  end

  it "Email should be a valid email" do
    @atol.email = "atolboiola"
    @atol.valid?.should be_false
  end


end
