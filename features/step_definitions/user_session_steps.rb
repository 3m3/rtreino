def register_user(options={})
  options[:confirmation_ok] = true
  options[:username] = 'User' unless options.has_key? :username
  @user ||= Factory.create(:user, options)
end

def login(options={})
  register_user(options)
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

Given /^I login as admin$/ do
  login(:admin => true)
end

Given /^I login as "([^\"]*)"$/ do |username|
  login(:username => username)
end

When /^I am logged in$/ do
  login
end
