require 'timeout'

Given /^user = "([^\"]*)"$/ do |user|
  @user = user
end

When /^I ask for submissions$/ do
  
end

Then /^I should get the submissions$/ do
  submission = {"Run ID" => "5137643",
                "User" => "rtreino",
                "Problem" => "1000",
                "Result" => "Wrong Answer",
                "Memory" => "",
                "Time" => "",
                "Language" => "GCC",
                "Code Length" => "30B",
                "Submit Time" => "2009-05-12 06:49:32"}
  begin 
    list = PKU.submissions_for(@user)
    list.count.should == 1
    list.first.should == submission
  rescue Timeout::Error
  end  
end