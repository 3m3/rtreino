require 'timeout'

Given /^user = "([^\"]*)"$/ do |user|
  @user = user
end

When /^I ask for submissions$/ do
  
end

Then /^I should get the submissions$/ do
  submission2 = {"Run ID" => "5137643",
                "User" => "rtreino",
                "Problem" => "1000",
                "Result" => "Wrong Answer",
                "Memory" => "",
                "Time" => "",
                "Language" => "GCC",
                "Code Length" => "30B",
                "Submit Time" => "2009-05-12 06:49:32"}
  submission1 = {"Run ID" => "5747447",
                "User" => "rtreino",
                "Problem" => "1000",
                "Result" => "Wrong Answer",
                "Memory" => "",
                "Time" => "",
                "Language" => "Fortran",
                "Code Length" => "73B",
                "Submit Time" => "2009-08-25 06:58:33"}                 
  begin 
    list = PKU.submissions_for(@user)
    list.should == [submission1, submission2]
  rescue Timeout::Error
  end  
end