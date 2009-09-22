def register_user
  @user ||= Factory.create(:user, :confirmation_ok => true)
end

def login
  register_user
  visit path_to("the homepage")
  response.should contain("Login")
  click_link "Login"
  fill_in "Username", :with => @user.username
  fill_in "Password", :with => @user.password
  click_button "Login"
  response.should contain("Login successful!")
  response.should contain("Edit profile")
  response.should contain("Logout")
end

Given /^I am a registered user$/ do
  register_user
end

When /^I login$/ do
  login
end

When /^I am logged in$/ do
  login
end
